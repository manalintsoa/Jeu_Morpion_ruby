require 'bundler'
Bundler.require

#LIAISON AVEC L'APPLICATION
# $:.unshift File.expand_path("../lib/", __FILE__)
require_relative 'lib/application'


# Démarrage du jeu au travers du perform du controlleur
Application.new.perform