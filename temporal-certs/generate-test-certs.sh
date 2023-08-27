# This scripts generates test keys and certificates for the sample.
# In a production environment such artifacts should be generated
# by a proper certificate authority and handled in a secure manner.

CERTS_DIR=./certs
mkdir $CERTS_DIR

# Generate a private key and a certificate for a test certificate authority
openssl genrsa -out $CERTS_DIR/temporal-ca.key 4096
openssl req -new -x509 -key $CERTS_DIR/temporal-ca.key -sha256 -subj "/C=AU/ST=VIC/O=ORG" -days 365 -out $CERTS_DIR/temporal-ca.cert

# Generate a private key and a certificate for cluster 
openssl genrsa -out $CERTS_DIR/temporal-cluster.key 4096
openssl req -new -key $CERTS_DIR/temporal-cluster.key -out $CERTS_DIR/temporal-cluster.csr -config cluster-cert.conf
openssl x509 -req -in $CERTS_DIR/temporal-cluster.csr -CA $CERTS_DIR/temporal-ca.cert -CAkey $CERTS_DIR/temporal-ca.key -CAcreateserial -out $CERTS_DIR/temporal-cluster.pem -days 365 -sha256 -extfile cluster-cert.conf -extensions req_ext

# Generate a private key and a certificate for clients
openssl req -newkey rsa:4096 -nodes -keyout "$CERTS_DIR/temporal-client.key" -out "$CERTS_DIR/temporal-client.csr" -config client-cert.conf
openssl x509 -req -in $CERTS_DIR/temporal-client.csr -CA $CERTS_DIR/temporal-ca.cert -CAkey $CERTS_DIR/temporal-ca.key -CAcreateserial -out $CERTS_DIR/temporal-client.pem -days 365 -sha256 -extfile client-cert.conf -extensions req_ext
# Export to .pfx 
# "-keypbe NONE -certpbe NONE -passout pass:" specifies an unencrypted archive
openssl pkcs12 -export -out $CERTS_DIR/temporal-client.pfx -inkey $CERTS_DIR/temporal-client.key -in $CERTS_DIR/temporal-client.pem -keypbe NONE -certpbe NONE -passout pass:
