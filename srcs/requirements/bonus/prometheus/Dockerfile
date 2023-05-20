FROM	debian

WORKDIR /app

COPY	./conf/prometheus.yml /etc/prometheus/prometheus.yml
COPY	./conf/prometheus.service /etc/systemd/system/prometheus.service

RUN		apt update && apt -y upgrade
RUN		apt install -y vim telnet curl sudo systemctl
RUN		curl -LO https://github.com/prometheus/prometheus/releases/download/v2.22.0/prometheus-2.22.0.linux-amd64.tar.gz; \
		tar -xvf prometheus-2.22.0.linux-amd64.tar.gz; \
		mv prometheus-2.22.0.linux-amd64 prometheus-files; \
		sudo useradd --no-create-home --shell /bin/false prometheus; \
		sudo mkdir /etc/prometheus; \
		sudo mkdir /var/lib/prometheus; \
		sudo chown prometheus:prometheus /etc/prometheus; \
		sudo chown prometheus:prometheus /var/lib/prometheus; \
		sudo cp prometheus-files/prometheus /usr/local/bin/; \
		sudo cp prometheus-files/promtool /usr/local/bin/; \
		sudo chown prometheus:prometheus /usr/local/bin/prometheus; \
		sudo chown prometheus:prometheus /usr/local/bin/promtool; \
		sudo cp -r prometheus-files/consoles /etc/prometheus; \
		sudo cp -r prometheus-files/console_libraries /etc/prometheus; \
		sudo chown -R prometheus:prometheus /etc/prometheus/consoles; \
		sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries; \
		sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml; \
		sudo systemctl daemon-reload; \
		sudo systemctl start prometheus

EXPOSE	9090

ENTRYPOINT [ "prometheus", "--config.file=/etc/prometheus/prometheus.yml" ]

