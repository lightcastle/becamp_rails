class SeedSponsors < ActiveRecord::Migration
  def up
    return unless Sponsor.count == 0
    sponsors_array = [
      [400, "http://lightcastletech.com/", "http://becamp.org/assets/lightcastle_s-03aa32173940d7c7161c7be5bfc2bf7ee01eaeec4c5814198fd1cd64e04e6f0a.png"],
      [400, "http://opensourceconnections.com/", "http://becamp.org/assets/osc_s-3b605eb342fbb5677b048902d1deaeac296daa5293bf10055f4690266e016386.png"]
    ]

    sponsors_array.each_with_index do |sponsor, index|
      Sponsor.create(width: sponsor[0], homepage_url: sponsor[1], logo_url: sponsor[2], sequence: index * 10)
    end
  end
end
