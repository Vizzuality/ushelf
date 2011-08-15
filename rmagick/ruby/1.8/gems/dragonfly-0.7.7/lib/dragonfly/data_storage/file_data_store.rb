require 'pathname'

module Dragonfly
  module DataStorage

    class FileDataStore

      include Configurable

      configurable_attr :root_path, '/var/tmp/dragonfly'

      def store(temp_object, opts={})
        relative_path = if opts[:path]
          opts[:path]
        else
          filename = temp_object.name || 'file'
          relative_path = relative_path_for(filename)
        end

        begin
          path = absolute(relative_path)
          until !File.exist?(path)
            path = disambiguate(path)
          end
          prepare_path(path)
          temp_object.to_file(path).close
          store_extra_data(path, temp_object)
        rescue Errno::EACCES => e
          raise UnableToStore, e.message
        end

        relative(path)
      end

      def retrieve(relative_path)
        path = absolute(relative_path)
        file = File.new(path)
        file.close
        [
          file,
          retrieve_extra_data(path)
        ]
      rescue Errno::ENOENT => e
        raise DataNotFound, e.message
      end

      def destroy(relative_path)
        path = absolute(relative_path)
        FileUtils.rm path
        FileUtils.rm extra_data_path(path)
        purge_empty_directories(relative_path)
      rescue Errno::ENOENT => e
        raise DataNotFound, e.message
      end

      def disambiguate(path)
        dirname = File.dirname(path)
        basename = File.basename(path, '.*')
        extname = File.extname(path)
        "#{dirname}/#{basename}_#{Time.now.usec.to_s(32)}#{extname}"
      end

      private

      def absolute(relative_path)
        File.join(root_path, relative_path)
      end

      def relative(absolute_path)
        absolute_path[/^#{root_path}\/(.*)$/, 1]
      end

      def directory_empty?(path)
        Dir.entries(path) == ['.','..']
      end

      def extra_data_path(data_path)
        "#{data_path}.extra"
      end

      def relative_path_for(filename)
        "#{Time.now.strftime '%Y/%m/%d'}/#{filename.gsub(/[^\w.]+/,'_')}"
      end

      def store_extra_data(data_path, temp_object)
        File.open(extra_data_path(data_path), 'wb') do |f|
          f.write Marshal.dump(temp_object.attributes)
        end
      end

      def retrieve_extra_data(data_path)
        path = extra_data_path(data_path)
        File.exist?(path) ?  File.open(path,'rb'){|f| Marshal.load(f.read) } : {}
      end

      def prepare_path(path)
        dir = File.dirname(path)
        FileUtils.mkdir_p(dir) unless File.exist?(dir)
      end

      def purge_empty_directories(path)
        containing_directory = Pathname.new(path).dirname
        containing_directory.ascend do |relative_dir|
          dir = absolute(relative_dir)
          FileUtils.rmdir dir if directory_empty?(dir)
        end
      end

    end

  end
end
