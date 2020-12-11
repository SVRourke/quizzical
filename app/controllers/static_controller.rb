class StaticController < ApplicationController
    def welcome
        authorized_redirect
    end
end