mongoose = require 'mongoose'

Images = mongoose.Schema
  url: 'string'

schema = mongoose.Schema
  name: 'string'
  images: [Images]
  position:
    type: 'number'
    required: true
    default: 1
  , { toJSON: { virtuals: true } }

schema.virtual('id').get ->
  @_id.toHexString()

module.exports = User = mongoose.model 'User', schema
