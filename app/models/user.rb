class User < ApplicationRecord
  CONFIRMATION_TOKEN_EXPIRATION = 10.minutes

  before_create :confirmation_token

  enum email_confirmed: { uncomfirmed: 0, confirmed: 1 }
  enum two_factor: { false: 0, true: 1, two_factor_confirm: 2, two_factor_uncomfirmed: 3 }
  MAILER_FROM_EMAIL = 'no-reply@example.com'


  def email_activate
    self.email_confirmed = 1
    self.confirm_token = nil
    save!(:validate => false)
  end

  def send_confirmation_email
    confirmation_token = generate_confirmation_token
    if self.confirm_token 
      UserMailer.confirmation_email(self, self.confirm_token).deliver_now
    else
      UserMailer.confirmation_email(self, confirmation_token).deliver_now
    end
  end

  def generate_confirmation_token
    signed_id expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: :confirm_email
  end

  def add_two_factor
    self.two_factor = 1
    save
  end

  def spotify_genres
    [
    "acoustic",
    "afrobeat",
    "alt_rock",
    "alternative",
    "ambient",
    "anime",
    "black_metal",
    "bluegrass",
    "blues",
    "bossanova",
    "brazil",
    "breakbeat",
    "british",
    "cantopop",
    "chicago_house",
    "children",
    "chill",
    "classical",
    "club",
    "comedy",
    "country",
    "dance",
    "dancehall",
    "death_metal",
    "deep_house",
    "detroit_techno",
    "disco",
    "disney",
    "drum_and_bass",
    "dub",
    "dubstep",
    "edm",
    "electro",
    "electronic",
    "emo",
    "folk",
    "forro",
    "french",
    "funk",
    "garage",
    "german",
    "gospel",
    "goth",
    "grindcore",
    "groove",
    "grunge",
    "guitar",
    "happy",
    "hard_rock",
    "hardcore",
    "hardstyle",
    "heavy_metal",
    "hip_hop",
    "holidays",
    "honky_tonk",
    "house",
    "idm",
    "indian",
    "indie",
    "indie_pop",
    "industrial",
    "iranian",
    "j_dance",
    "j_idol",
    "j_pop",
    "j_rock",
    "jazz",
    "k_pop",
    "kids",
    "latin",
    "latino",
    "malay",
    "mandopop",
    "metal",
    "metal_misc",
    "metalcore",
    "minimal_techno",
    "movies",
    "mpb",
    "new_age",
    "new_release",
    "opera",
    "pagode",
    "party",
    "philippines_opm",
    "piano",
    "pop",
    "pop_film",
    "post_dubstep",
    "power_pop",
    "progressive_house",
    "psych_rock",
    "punk",
    "punk_rock",
    "r_n_b",
    "rainy_day",
    "reggae",
    "reggaeton",
    "road_trip",
    "rock",
    "rock_n_roll",
    "rockabilly",
    "romance",
    "sad",
    "salsa",
    "samba",
    "sertanejo",
    "show_tunes",
    "singer_songwriter",
    "ska",
    "sleep",
    "songwriter",
    "soul",
    "soundtracks",
    "spanish",
    "study",
    "summer",
    "swedish",
    "synth_pop",
    "tango",
    "techno",
    "trance",
    "trip_hop",
    "turkish",
    "work_out",
    "world_music"
    ]
  end

  private

  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
