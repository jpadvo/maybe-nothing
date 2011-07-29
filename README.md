Introduction
============

This gem is based in its entirety on code and ideas found in Joe Ferris's post here:

http://robots.thoughtbot.com/post/8181879506/if-you-gaze-into-nil-nil-gazes-also-into-you


Usage
=====

If an object might be nil, call .maybe to wrap it:

    def get_user(id)
      Users.find(id).maybe
    end

You can unwrap objects like such:

    user_wrapped = get_user
    if user_wrapped.present?
      user = user_wrapped.get
    else
      user = User.new
    end


Methods
=======
    
To retrieve the object that has been wrapped, use .get. This method will raise an Unwrapped exception if called on nil.maybe.

    object.maybe.get  # returns object
    nil.maybe.get     # raises MaybeNothing::None::Unwrapped exception


To check if the wrapped object is nil, use present? or blank?.
    
    object.maybe.present?  # returns true
    object.maybe.blank?    # returns false
    
        
    nil.maybe.present?  # returns false
    nil.maybe.blank?    # returns true