# Qantani
[![Gem Version](https://badge.fury.io/rb/qantani.png)][gem]
[![Build
Status](https://secure.travis-ci.org/pepijn/qantani.png?branch=master)](https://travis-ci.org/pepijn/qantani)
[![Dependency
Status](https://gemnasium.com/pepijn/qantani.png)](https://gemnasium.com/pepijn/qantani)
[![Code
Climate](https://codeclimate.com/github/pepijn/qantani.png)](https://codeclimate.com/github/pepijn/qantani)

Easier Qantani payments.
[RDocs](http://rdoc.info/projects/pepijn/qantani).

[gem]: https://rubygems.org/gems/qantani

Installation
------------

Supports Ruby >= 2.0.0. Add to your Gemfile:

```ruby
gem 'qantani'
```

Run `bundle` and add your personal configuration.

```ruby
Qantani.config(
  merchant_id: 42,
  merchant_key: 'key',
  merchant_secret: 'secret'
)
```

Using Rails? Use different Qantani configurations by adding them in their respective `config/environments/{development,test,production}.rb` environment configuration files.

