            class ApplicationController < ActionController::Base
        include DeviseTokenAuth::Concerns::SetUserByToken
              def whatever
                'whatever'
              end
            end
