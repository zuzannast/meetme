module Users
  class CreateProfileTraits
    attr_accessor :profile, :params

    def initialize(profile, params)
      @profile = profile
      @params = params
    end

    def call
      create_or_update_profile_traits
    end

    private

    def create_or_update_profile_traits
      traits.each do |trait|
        value = trait_params[trait.id.to_s].to_i
        profile_trait = find_profile_trait(trait.id, value)

        if profile_trait.present?
          update_profile_trait(profle_trait, value)
        else
          create_profile_trait(trait.id, value)
        end
      end
    end

    def create_profile_trait(trait_id, value)
      ProfileTrait.create(
        profile_id: profile.id,
        trait_id: trait_id,
        value: value
      )
    end

    def update_profile_trait(profile_trait, value)
      profile_trait.update_attribute(:value, value)
    end

    def find_profile_trait(trait_id, value)
      ProfileTrait.find_by(
        profile_id: profile.id,
        trait_id: trait_id
      )
    end

    def trait_params
      params["user"]["profile_attributes"]["trait_attributes"]["value"]
    end

    def traits
      Trait.all
    end
  end
end
