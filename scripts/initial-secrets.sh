#!/bin/sh

SRC_FILE=/secrets/secrets.txt
DST_FILE=/var/lib/rancher/k3s/server/manifests/initial-secrets.yaml
SECRET=initial-secret
TMP_FILE=/tmp/${SECRET}.tmp

cat <<END > "${TMP_FILE}"
apiVersion: v1
kind: Secret
metadata:
  name: ${SECRET}
type: Opaque
data:
END

cat ${SRC_FILE} | while read line
do
  KEY=$(echo "${line}" | cut -d= -f1)
  VALUE=$(echo "${line}" | cut -d= -f2)

  echo "  ${KEY}: $(echo -n "${VALUE}" | base64)" >> ${TMP_FILE}
done

echo "Done initializing secrets - [${DST_FILE}]"
cp ${TMP_FILE} ${DST_FILE}
