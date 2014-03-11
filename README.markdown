#phpapc

Simple module to install and configure PHP apc cache

## Example Usage

### Minimal

This should install PHP apc for your system

```puppet
class { 'phpapc': }
```

The above won't notify the PHP service, so you might want to do:

```puppet
class { 'phpapc': } ~> Class['phpfpm']
```

Modify depending on how you're using PHP.

### Customise PHP config

You can pass a hash named 'config' with arbtirary settings.  These
should not include the leading 'apc.'.  For example:

```puppet
class { 'phpapc':
  config                => {
    enable_opcode_cache => 1,
    shm_size            => '512M',
    stat                => 0
  }
}
```

You could of course use hiera for the above:

```puppet
class { 'phpapc': }
```

```yaml
phpapc::config:
  enable_opcode_cache: 1
  shm:size: 512M
  stat: 0
```
