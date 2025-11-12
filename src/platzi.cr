require "json"
require "http/client"

class Platzi
  API_PATH = "/api/v1"

  def initialize
    @headers = HTTP::Headers{
      "Content-Type" => "application/json",
      "Accept" => "application/json",
      "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36"
    }
    uri = URI.parse("https://api.escuelajs.co")
    @http_client = HTTP::Client.new(uri)
  end

  def get_products() : JSON::Any
    JSON.parse(
      @http_client.get("#{API_PATH}/products", headers: @headers).body)
  end

  def get_product(product_id : Int32) : JSON::Any
    JSON.parse(
      @http_client.get("#{API_PATH}/products/#{product_id}", headers: @headers).body)
  end

  def get_product_by_slug(slug : String) : JSON::Any
    JSON.parse(
      @http_client.get("#{API_PATH}/products/slug/#{slug}", headers: @headers).body)
  end

  def create_product(
      title : String,
      price : Int32,
      description : String,
      category_id : Int32,
      images : Array(String)) : JSON::Any
    body = {
      "title" => title,
      "price" => price,
      "description" => description,
      "categoryId" => category_id,
      "images" => images
    }.to_json
    JSON.parse(
      @http_client.post("#{API_PATH}/products", headers: @headers, body: body).body)
  end

  def delete_product(product_id : Int32) : Boolean
    @http_client.delete("#{API_PATH}/products/#{product_id}", headers: @headers).body
  end

  def get_categories() : JSON::Any
    JSON.parse(
      @http_client.get("#{API_PATH}/categories", headers: @headers).body)
  end

  def get_category(category_id : Int32) : JSON::Any
    JSON.parse(
      @http_client.get("#{API_PATH}/categories/#{category_id}", headers: @headers).body)
  end

  def get_category_by_slug(slug : String) : JSON::Any
    JSON.parse(
      @http_client.get("#{API_PATH}/categories/slug/#{slug}", headers: @headers).body)
  end

  def create_category(name : String, image : String) : JSON::Any
    body = {"name" => name, "image" => image}.to_json
    JSON.parse(
      @http_client.post("#{API_PATH}/categories", headers: @headers, body: body).body)
  end

  def delete_category(category_id : Int32) : Boolean
    @http_client.delete("#{API_PATH}/categories/#{category_id}", headers: @headers).body
  end

  def get_users() : JSON::Any
    JSON.parse(
      @http_client.get("#{API_PATH}/users", headers: @headers).body)
  end

  def get_user(user_id : Int32) : JSON::Any
    JSON.parse(
      @http_client.get("#{API_PATH}/users/#{user_id}", headers: @headers).body)
  end

  def create_user(
      name : String,
      email : String,
      password : String,
      avatar : String) : JSON::Any
    body = {
      "name" => name,
      "email" => email,
      "password" => password,
      "avatar" => avatar
    }.to_json
    JSON.parse(@http_client.post("#{API_PATH}/users", headers: @headers, body: body).body)
  end

  def check_email(email : String)
    body = {"email" => email}.to_json
    JSON.parse(
      @http_client.post("#{API_PATH}/users/is-available", headers: @headers, body: body).body)
  end
  
  def get_locations() : JSON::Any
    JSON.parse(
      @http_client.get("#{API_PATH}/locations", headers: @headers).body)
  end
end
