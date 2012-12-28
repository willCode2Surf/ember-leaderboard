mongoose = require 'mongoose'

schema = mongoose.Schema
  name: 'string'
  position:
    type: 'number'
    required: true
    default: 1
  , { toJSON: { virtuals: true } }

schema.virtual('id').get ->
  @_id.toHexString()

module.exports = User = mongoose.model 'User', schema
