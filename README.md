log4r outputter support for hipchat

```yaml
  outputters:
    - type     : HipchatOutputter
      name     : hipchatter
      level    : ALARM
      api_token: 'xxxxxxxxx'
      room     : 'my room'
      color    : 'red'
      username : 'the program'
      notify   : 'true'
      message_format: 'text'
      formatter:
        date_pattern: '%y%m%d %H:%M:%S.%L'
        pattern     : '%d %p %C %l %M'
        type        : PatternFormatter
```
