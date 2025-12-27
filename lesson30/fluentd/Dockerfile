FROM fluent/fluentd:v1.11-1

# Use root account to use apk
USER root

# below RUN includes plugin as examples elasticsearch is not required
# you may customize including plugins as you wish
RUN apk add --no-cache --update --virtual .build-deps \
    sudo build-base ruby-dev \
    && gem install multi_json -v 1.15.0 \
    && gem install faraday-net_http -v 3.0.2 \
    && sudo gem install elasticsearch -v 7.6 \
    && sudo gem install fluent-plugin-elasticsearch \
    && sudo gem install fluent-plugin-grok-parser \
    && sudo gem sources --clear-all \
    && apk del .build-deps \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

USER fluent