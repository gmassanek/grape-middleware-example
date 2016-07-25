# Grape Middleware Example

This is a boilerplate grape api that demonstrates a possible issue with cascading routes and middleware.

```
git clone https://github.com/gmassanek/grape-middleware-example.git
cd grape-middleware-example
bundle
bundle exec rspec
```

The issue is that when Grape falls back from v2 to v1, it executes the outer middleware twice.
