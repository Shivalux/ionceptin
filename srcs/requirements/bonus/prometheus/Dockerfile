FROM	debian

WORKDIR /app

COPY	./conf/prometheus.yml /etc/prometheus/prometheus.yml
COPY	./conf/prometheus.service /etc/systemd/system/prometheus.service

RUN		apt update && apt -y upgrade
RUN		apt install -y vim telnet curl sudo systemctl
RUN		curl -LO https://github.com/prometheus/prometheus/releases/download/v2.22.0/prometheus-2.22.0.linux-arm64.tar.gz
RUN		tar -xvf prometheus-2.22.0.linux-arm64.tar.gz;
RUN		mv prometheus-2.22.0.linux-arm64 prometheus-files;
RUN		sudo useradd --no-create-home --shell /bin/false prometheus;
RUN		sudo mkdir -p /etc/prometheus;
RUN		sudo mkdir -p /var/lib/prometheus;
RUN		sudo chown prometheus:prometheus /etc/prometheus;
RUN		sudo chown prometheus:prometheus /var/lib/prometheus;
RUN		sudo cp prometheus-files/prometheus /usr/local/bin/;
RUN		sudo cp prometheus-files/promtool /usr/local/bin/;
RUN		sudo chown prometheus:prometheus /usr/local/bin/prometheus;
RUN		sudo chown prometheus:prometheus /usr/local/bin/promtool;
RUN		sudo cp -r prometheus-files/consoles /etc/prometheus;
RUN		sudo cp -r prometheus-files/console_libraries /etc/prometheus;
RUN		sudo chown -R prometheus:prometheus /etc/prometheus/consoles;
RUN		sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries;
RUN		sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml;
RUN		sudo systemctl daemon-reload;
RUN		sudo systemctl start prometheus;
e

EXPOSE	9090

ENTRYPOINT [ "prometheus", "--config.file=/etc/prometheus/prometheus.yml" ]
