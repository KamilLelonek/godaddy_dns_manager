# godaddy_dns_manager

Automatic Certificate Manager based on GoDaddy, Google Cloud Platform and certbot integration.

## Usage

### GoDaddyAuth

This module is used to interact with [GoDaddy API](https://developer.godaddy.com/doc/endpoint/domains).

It provides the following functions:

#### `create_record/1`

Sets the value of `_acme-challenge` TXT record.
The given argument should be the value to set.

#### `cleanup_record/0`

Removes the value of `_acme-challenge` TXT record.
The result will be `...` to indicate it should not be used.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `godaddy_dns_manager` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:godaddy_dns_manager, "~> X.X.X"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/godaddy_dns_manager>.
