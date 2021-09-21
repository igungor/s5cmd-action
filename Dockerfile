FROM peakcom/s5cmd:1.3.0

LABEL "com.github.actions.name"="s5cmd"
LABEL "com.github.actions.description"="Run s5cmd commands"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="yellow"

LABEL version="0.1.0"
LABEL repository="https://github.com/igungor/s5cmd-action"
LABEL homepage="github.com/peak/s5cmd"
LABEL maintainer="Ibrahim Gungor <ibrahim@peak.com>"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
