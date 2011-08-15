require 'aws/s3'

module Dragonfly
  module DataStorage

    class S3DataStore

      include Configurable
      include AWS::S3
      include Serializer

      configurable_attr :bucket_name
      configurable_attr :access_key_id
      configurable_attr :secret_access_key
      configurable_attr :use_filesystem, true

      def initialize(opts={})
        self.bucket_name = opts[:bucket_name]
        self.access_key_id = opts[:access_key_id]
        self.secret_access_key = opts[:secret_access_key]
      end

      def connect!
        AWS::S3::Base.establish_connection!(
          :access_key_id => access_key_id,
          :secret_access_key => secret_access_key
        )
      end

      def create_bucket!
        Bucket.create(bucket_name) unless bucket_names.include?(bucket_name)
      end

      def store(temp_object, opts={})
        uid = opts[:path] || generate_uid(temp_object.name || 'file')
        ensure_initialized
        object = use_filesystem ? temp_object.file : temp_object.data
        extra_data = temp_object.attributes
        S3Object.store(uid, object, bucket_name, s3_metadata_for(extra_data))
        object.close if use_filesystem
        uid
      end

      def retrieve(uid)
        ensure_initialized
        s3_object = S3Object.find(uid, bucket_name)
        [
          s3_object.value,
          parse_s3_metadata(s3_object.metadata)
        ]
      rescue AWS::S3::NoSuchKey => e
        raise DataNotFound, "#{e} - #{uid}"
      end

      def destroy(uid)
        ensure_initialized
        S3Object.delete(uid, bucket_name)
      rescue AWS::S3::NoSuchKey => e
        raise DataNotFound, "#{e} - #{uid}"
      end

      private

      def bucket_names
        Service.buckets.map{|bucket| bucket.name }
      end

      def ensure_initialized
        unless @initialized
          connect!
          create_bucket!
          @initialized = true
        end
      end

      def generate_uid(name)
        "#{Time.now.strftime '%Y/%m/%d/%H/%M/%S'}/#{rand(1000)}/#{name.gsub(/[^\w.]+/, '_')}"
      end

      def s3_metadata_for(extra_data)
        {'x-amz-meta-extra' => marshal_encode(extra_data)}
      end

      def parse_s3_metadata(metadata)
        extra_data = metadata['x-amz-meta-extra']
        marshal_decode(extra_data) if extra_data
      end

    end

  end
end
