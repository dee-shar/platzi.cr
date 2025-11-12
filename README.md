# platzi.cr
Web-API for fakeapi.platzi.com the perfect API solution for your e-commerce or shopping website prototype.

## Example
```cr
require "./platzi"

platzi = Platzi.new
users = platzi.get_users()
puts users
```
