namespace :ushelf do
  namespace :import do
    desc 'Import original data from CSV'
    task :original_csv => :environment do
      csv = CsvMapper.import("#{Rails.root}/db/data/ECS.kml.csv") do
        read_attributes_from_file
      end
      return if csv.blank?
      DB = ActiveRecord::Base.connection
      DB.execute 'DELETE FROM features'
      csv.each do |row|
        #description,name,ex_ECS_ID,ex_STATE,ex_REF,ex_STATUS,ex_DATE,geometry
        f = Feature.new
        f.title = row.name
        f.description = row.description
        f.ecs_id = row.ex_ecs_id
        f.state = row.ex_state
        f.ref = row.ex_ref
        f.status = row.ex_status
        f.submission_date = row.ex_date
        f.the_geom = 'POINT(0 0)'
        f.save!
        sql = "update features set the_geom = (
        select ST_Multi(ST_Collect(f.the_geom)) as singlegeom from
        (
        select 1 as id,
        	(ST_Dump(
        	ST_Force_2D(
        ST_GeomFromKML('#{row.geometry}')
        )
        )).geom as the_geom
        ) as f
        group by f.id ) WHERE id=#{f.id}"
        #puts sql
        DB.execute sql
      end
    end
  end
end