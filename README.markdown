This is an adaptation on Michael Grosser's translated attributes, but lightly adapted for rails 3 and ruby 1.9 and my own needs, and it may not work properly with older versions.

Rails plugin/ActiveRecord gem that creates 'virtual' attributes, which can be added on the fly without overhead or migrations, while storing all the data in a never-changing translations table.
This keeps the attatched model light and allows to add/remove fields on the fly without migrations.

Validations work like normal with current field (e.g. title) or any translation (e.g. title_in_en)

Usage
=====
 - Add 'gem teonimesic-translated_attributes to Gemfile'
 - run 'rails g translated_attributes' and run migration

Adding attributes:
    class Product < ActiveRecord::Base
      translated_attributes :description, :title, :additional_info
    end

Setting / getting
    #getter
    product.title -> 'Hello' #when I18n.locale is :en
    product.title_in_fr -> 'Bonyour'
    product.title_in_de -> 'Hallo'

    #setter
    product.title = 'Simple setting' #sets title_in_en when I18n.locale == :en
    product.title_in_de = 'Spezifisches speichern'

    #generic setter/getter
    product.set_title('Specific setting', :en)
    product.get_title(:en) -> 'Specific setting'


Usage with saving works exactly like normal saving, e.g. new/create/update_attributes...
    Product.new(:title_in_en=>'Hello').save!
    product.update_attribute(:title, 'Goodbye')
    
Or you can use the :index option on FormBuilder's' methods for the following usage: (works with new/create/update_attributes as well)
    Product.new(
      en: {title: 'Ruby', description: 'A very cool programing language', additional_info: 'It's free!'}
      pt: {title: 'Ruby', description: 'Uma linguagem de programação muito legal', additional_info: 'É gratis!'}
    )

 - Translations are stored on 'save'
 - blank translations are NOT stored
 - translations are accessable via .translations or as hash via .translated_attributes

Options
=======
    translated_attributes :title, :heading,
    :table_name => 'user_translations', #default is translations
    :nil_to_blank => true, #return unfound translations as blank strings ('') instead of nil (default false),
    :translatable_name => 'translated' #name of the associated translatable (Product has_many :translations a Translation belongs_to XXX), default is :translatable
Authors
======
[Michael Grosser](http://pragmatig.wordpress.com) and [Stefano Diem Benatti](http://heavenstudio.com.br) 
grosser.michael@gmail.com, stefano.diem@gmail.com  
Hereby placed under public domain, do what you want, just do not hold us accountable...
Also i would like to thanks Michael Grosser for his work on the original gem, it has the best API for database translations that i found for Ruby/Rails.
