FROM rancher/k3s:v1.26.4-rc1-k3s1-amd64

COPY addons/*.yaml /var/lib/rancher/k3s/server/manifests/
COPY scripts/*.sh /scripts/

ENTRYPOINT ["/scripts/entry.sh"]
CMD ["agent"]
