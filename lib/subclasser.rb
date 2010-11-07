# A simple module to find subclasses of a particular class.
# As far as I know, there is no easy way to do this in Rails,
# especially with its lazy loading.
module Subclasser

  # Slight tweak to aid in performance -- Keep a cache of
	# past searched items.
  @@static_subclass_list = {}

  def self.get_subclasses_for(parent_class)

    # Check to see if we have it in memory first.  If so, use that
    # instead of hitting the disk every time.
    if @@static_subclass_list.has_key?(parent_class.to_s.downcase)

      return @@static_subclass_list[parent_class.to_s.downcase]

    else

      array_to_return = []

      # Construct the subclass directory
      subclass_dir = Rails.root + "app/models/" + parent_class.to_s.split("::").first.downcase

      if File.exists? subclass_dir

        # Open only ruby files.
        filelist = Dir.glob("#{subclass_dir}/*.rb")

        filelist.each do |filename|
          file = File.open(filename, "r")

          file.each do |line|
            # Look for something similiar to: "class Payment::Book < Payment"
            # and extract "Payment::Book".  This is the subclass.
            if line.index /^class\s+(#{parent_class}::\w+)\s+<\s+#{parent_class}/i
              array_to_return << $1
              break
            end
          end
        end
      end

      @@static_subclass_list[parent_class.to_s.downcase] = array_to_return
      array_to_return
    end
  end
end
