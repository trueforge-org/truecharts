{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "allOf": [
    {
      "$ref": "https://k8s-schemas.home-operations.com/helm.toolkit.fluxcd.io/helmrelease_v2.json"
    }
  ],
  "type": "object",
  "properties": {
    "spec": {
      "type": "object",
      "properties": {
        "values": {
          "$ref": "https://raw.githubusercontent.com/trueforge-org/websites/refs/heads/main/truecharts/public/schemas/common/__COMMON_VERSION__.schema.json"
        }
      }
    }
  }
}
