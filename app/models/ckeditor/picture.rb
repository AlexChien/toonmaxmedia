require "fileutils"

class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :url  => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :styles => { :content => '800>', :thumb => '118x100#' }

  validates_attachment_size :data, :less_than => 2.megabytes
  validates_attachment_presence :data

  def url_content
    url(:content)
  end

  def self.move_files_to_ided_fs
    dir = "#{Rails.root}/public/ckeditor_assets/pictures"
    self.all.each do |pic|
      unless File.directory?("#{dir}/#{pic.id}")
        Dir.mkdir("#{dir}/#{pic.id}")
      end
      ided_dir = "#{dir}/#{pic.id}"
      files = %w(content thumb original).collect{ |style| "#{dir}/#{style}_#{pic.data_file_name}" }
      cp( files, ided_dir )
    end
  end
end
