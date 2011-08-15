# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{nofxx-georuby}
  s.version = "1.7.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Guilhem Vellut", "Marcos Piccinini"]
  s.date = %q{2010-09-20}
  s.description = %q{GeoRuby provides geometric data types from the OGC 'Simple Features' specification.}
  s.email = %q{x@nofxx.com}
  s.extra_rdoc_files = ["LICENSE", "README.txt"]
  s.files = [".gitignore", "History.txt", "LICENSE", "README.txt", "Rakefile", "VERSION", "lib/geo_ruby.rb", "lib/geo_ruby/gpx.rb", "lib/geo_ruby/gpx4r/gpx.rb", "lib/geo_ruby/shp.rb", "lib/geo_ruby/shp4r/dbf.rb", "lib/geo_ruby/shp4r/shp.rb", "lib/geo_ruby/simple_features/envelope.rb", "lib/geo_ruby/simple_features/ewkb_parser.rb", "lib/geo_ruby/simple_features/ewkt_parser.rb", "lib/geo_ruby/simple_features/geometry.rb", "lib/geo_ruby/simple_features/geometry_collection.rb", "lib/geo_ruby/simple_features/geometry_factory.rb", "lib/geo_ruby/simple_features/georss_parser.rb", "lib/geo_ruby/simple_features/helper.rb", "lib/geo_ruby/simple_features/line_string.rb", "lib/geo_ruby/simple_features/linear_ring.rb", "lib/geo_ruby/simple_features/multi_line_string.rb", "lib/geo_ruby/simple_features/multi_point.rb", "lib/geo_ruby/simple_features/multi_polygon.rb", "lib/geo_ruby/simple_features/point.rb", "lib/geo_ruby/simple_features/polygon.rb", "nofxx-georuby.gemspec", "script/console", "script/destroy", "script/generate", "script/txt2html", "spec/data/gpx/fells_loop.gpx", "spec/data/gpx/long.gpx", "spec/data/gpx/long.kml", "spec/data/gpx/long.nmea", "spec/data/gpx/short.gpx", "spec/data/gpx/short.kml", "spec/data/gpx/tracktreks.gpx", "spec/data/multipoint.dbf", "spec/data/multipoint.shp", "spec/data/multipoint.shx", "spec/data/point.dbf", "spec/data/point.shp", "spec/data/point.shx", "spec/data/polygon.dbf", "spec/data/polygon.shp", "spec/data/polygon.shx", "spec/data/polyline.dbf", "spec/data/polyline.shp", "spec/data/polyline.shx", "spec/geo_ruby/gpx4r/gpx_spec.rb", "spec/geo_ruby/shp4r/shp_spec.rb", "spec/geo_ruby/simple_features/envelope_spec.rb", "spec/geo_ruby/simple_features/ewkb_parser_spec.rb", "spec/geo_ruby/simple_features/ewkt_parser_spec.rb", "spec/geo_ruby/simple_features/geometry_collection_spec.rb", "spec/geo_ruby/simple_features/geometry_factory_spec.rb", "spec/geo_ruby/simple_features/geometry_spec.rb", "spec/geo_ruby/simple_features/georss_parser_spec.rb", "spec/geo_ruby/simple_features/line_string_spec.rb", "spec/geo_ruby/simple_features/linear_ring_spec.rb", "spec/geo_ruby/simple_features/multi_line_string_spec.rb", "spec/geo_ruby/simple_features/multi_point_spec.rb", "spec/geo_ruby/simple_features/multi_polygon_spec.rb", "spec/geo_ruby/simple_features/point_spec.rb", "spec/geo_ruby/simple_features/polygon_spec.rb", "spec/geo_ruby_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/nofxx/georuby}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ruby data holder for OGC Simple Features}
  s.test_files = ["spec/geo_ruby_spec.rb", "spec/spec_helper.rb", "spec/geo_ruby/gpx4r/gpx_spec.rb", "spec/geo_ruby/shp4r/shp_spec.rb", "spec/geo_ruby/simple_features/point_spec.rb", "spec/geo_ruby/simple_features/geometry_factory_spec.rb", "spec/geo_ruby/simple_features/envelope_spec.rb", "spec/geo_ruby/simple_features/polygon_spec.rb", "spec/geo_ruby/simple_features/line_string_spec.rb", "spec/geo_ruby/simple_features/multi_line_string_spec.rb", "spec/geo_ruby/simple_features/ewkt_parser_spec.rb", "spec/geo_ruby/simple_features/ewkb_parser_spec.rb", "spec/geo_ruby/simple_features/linear_ring_spec.rb", "spec/geo_ruby/simple_features/geometry_collection_spec.rb", "spec/geo_ruby/simple_features/multi_polygon_spec.rb", "spec/geo_ruby/simple_features/multi_point_spec.rb", "spec/geo_ruby/simple_features/georss_parser_spec.rb", "spec/geo_ruby/simple_features/geometry_spec.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_development_dependency(%q<dbf>, [">= 1.1.2"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<dbf>, [">= 1.1.2"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<dbf>, [">= 1.1.2"])
  end
end
