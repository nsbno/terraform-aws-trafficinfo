{
  "id": null,
  "title": "AWS ElastiCache Redis",
  "description": "Visualize AWS ElastiCache Redis metrics",
  "tags": [
    "terraform",
    "${name}",
    "${environment}",
    "${name_prefix}"
  ],
  "style": "dark",
  "timezone": "browser",
  "editable": true,
  "hideControls": true,
  "sharedCrosshair": false,
  "rows": [
    {
      "collapse": false,
      "editable": true,
      "height": "250px",
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "${name_prefix}-${environment}",
          "decimals": 3,
          "editable": true,
          "error": false,
          "fill": 1,
          "grid": {
            "threshold1": null,
            "threshold1Color": "rgba(216, 200, 27, 0.27)",
            "threshold2": null,
            "threshold2Color": "rgba(234, 112, 112, 0.22)"
          },
          "id": 13,
          "isNew": true,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null as zero",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "alias": "{{CacheClusterId}}_CacheHits",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "CacheHits",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "A",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            },
            {
              "alias": "{{CacheClusterId}}_CacheMisses",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "CacheMisses",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "B",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            },
            {
              "alias": "{{CacheClusterId}}_Evictions",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "Evictions",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "D",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            },
            {
              "alias": "{{CacheClusterId}}_Reclaimed",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "Reclaimed",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "C",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            }
          ],
          "timeFrom": null,
          "timeShift": null,
          "title": "Cache",
          "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "show": true
          },
          "yaxes": [
            {
              "format": "none",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": 0,
              "show": true
            },
            {
              "format": "none",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": 0,
              "show": true
            }
          ]
        }
      ],
      "title": "Row"
    },
    {
      "collapse": false,
      "editable": true,
      "height": "250px",
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "${name_prefix}-${environment}",
          "decimals": 3,
          "editable": true,
          "error": false,
          "fill": 1,
          "grid": {
            "threshold1": null,
            "threshold1Color": "rgba(216, 200, 27, 0.27)",
            "threshold2": null,
            "threshold2Color": "rgba(234, 112, 112, 0.22)"
          },
          "id": 17,
          "isNew": true,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "sort": "max",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null as zero",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "alias": "{{CacheClusterId}}_GetTypeCmds",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "GetTypeCmds",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "A",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            },
            {
              "alias": "{{CacheClusterId}}_HashBasedCmds",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "HashBasedCmds",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "B",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            },
            {
              "alias": "{{CacheClusterId}}_HashBasedCmds",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "HashBasedCmds",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "C",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            },
            {
              "alias": "{{CacheClusterId}}_ListBasedCmds",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "ListBasedCmds",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "D",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            },
            {
              "alias": "{{CacheClusterId}}_SetBasedCmds",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "SetBasedCmds",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "E",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            },
            {
              "alias": "{{CacheClusterId}}_SetTypeCmds",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "SetTypeCmds",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "F",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            },
            {
              "alias": "{{CacheClusterId}}_SortedSetBasedCmds",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "SortedSetBasedCmds",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "G",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            },
            {
              "alias": "{{CacheClusterId}}_StringBasedCmds",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "StringBasedCmds",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "H",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            }
          ],
          "timeFrom": null,
          "timeShift": null,
          "title": "Cmds",
          "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "show": true
          },
          "yaxes": [
            {
              "format": "none",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": 0,
              "show": true
            },
            {
              "format": "none",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": 0,
              "show": false
            }
          ]
        }
      ],
      "title": "New row"
    },
    {
      "collapse": false,
      "editable": true,
      "height": "250px",
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "${name_prefix}-${environment}",
          "decimals": 3,
          "editable": true,
          "error": false,
          "fill": 1,
          "grid": {
            "threshold1": null,
            "threshold1Color": "rgba(216, 200, 27, 0.27)",
            "threshold2": null,
            "threshold2Color": "rgba(234, 112, 112, 0.22)"
          },
          "id": 14,
          "isNew": true,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null as zero",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "CurrConnections_Average",
              "yaxis": 2
            }
          ],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "alias": "{{CacheClusterId}}_NewConnections",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "NewConnections",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "A",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            },
            {
              "alias": "{{CacheClusterId}}_CurrConnections",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "CurrConnections",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "B",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            }
          ],
          "timeFrom": null,
          "timeShift": null,
          "title": "Connections",
          "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "show": true
          },
          "yaxes": [
            {
              "format": "none",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": 0,
              "show": true
            },
            {
              "format": "none",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": 0,
              "show": true
            }
          ]
        }
      ],
      "title": "New row"
    },
    {
      "collapse": false,
      "editable": true,
      "height": "250px",
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "${name_prefix}-${environment}",
          "decimals": 3,
          "editable": true,
          "error": false,
          "fill": 1,
          "grid": {
            "threshold1": null,
            "threshold1Color": "rgba(216, 200, 27, 0.27)",
            "threshold2": null,
            "threshold2Color": "rgba(234, 112, 112, 0.22)"
          },
          "id": 16,
          "isNew": true,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null as zero",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "CurrItems_Average",
              "yaxis": 2
            }
          ],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "alias": "{{CacheClusterId}}_SaveInProgress",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "SaveInProgress",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "A",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            },
            {
              "alias": "{{CacheClusterId}}_CurrItems",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "CurrItems",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "B",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            }
          ],
          "timeFrom": null,
          "timeShift": null,
          "title": "SaveInProgress / CurrItems",
          "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "show": true
          },
          "yaxes": [
            {
              "format": "none",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": 0,
              "show": true
            },
            {
              "format": "none",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": 0,
              "show": true
            }
          ]
        }
      ],
      "title": "New row"
    },
    {
      "collapse": false,
      "editable": true,
      "height": "250px",
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "${name_prefix}-${environment}",
          "decimals": 3,
          "editable": true,
          "error": false,
          "fill": 1,
          "grid": {
            "threshold1": null,
            "threshold1Color": "rgba(216, 200, 27, 0.27)",
            "threshold2": null,
            "threshold2Color": "rgba(234, 112, 112, 0.22)"
          },
          "id": 12,
          "isNew": true,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null as zero",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "ReplicationBytes_Average",
              "yaxis": 2
            }
          ],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "alias": "{{CacheClusterId}}_BytesUsedForCache",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "BytesUsedForCache",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "A",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            },
            {
              "alias": "{{CacheClusterId}}_ReplicationBytes",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "ReplicationBytes",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "B",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            }
          ],
          "timeFrom": null,
          "timeShift": null,
          "title": "BytesUsedForCache / ReplicationBytes",
          "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "show": true
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": 0,
              "show": true
            },
            {
              "format": "bytes",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": 0,
              "show": true
            }
          ]
        }
      ],
      "title": "New row"
    },
    {
      "title": "New row",
      "height": "250px",
      "editable": true,
      "collapse": false,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "${name_prefix}-${environment}",
          "decimals": 3,
          "editable": true,
          "error": false,
          "fill": 1,
          "grid": {
            "threshold1": null,
            "threshold1Color": "rgba(216, 200, 27, 0.27)",
            "threshold2": null,
            "threshold2Color": "rgba(234, 112, 112, 0.22)"
          },
          "id": 15,
          "isNew": true,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null as zero",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "ReplicationLag_Average",
              "yaxis": 2
            }
          ],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "alias": "{{CacheClusterId}}_HyperLogLogBasedCmds",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "HyperLogLogBasedCmds",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "A",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            },
            {
              "alias": "{{CacheClusterId}}_ReplicationLag",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "ReplicationLag",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "B",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            }
          ],
          "timeFrom": null,
          "timeShift": null,
          "title": "HyperLogLogBasedCmds / ReplicationLag",
          "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "show": true
          },
          "yaxes": [
            {
              "format": "none",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": 0,
              "show": true
            },
            {
              "format": "s",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": 0,
              "show": true
            }
          ]
        }
      ]
    },
    {
      "title": "New row",
      "height": "250px",
      "editable": true,
      "collapse": false,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "${name_prefix}-${environment}",
          "decimals": 3,
          "editable": true,
          "error": false,
          "fill": 1,
          "grid": {
            "threshold1": null,
            "threshold1Color": "rgba(216, 200, 27, 0.27)",
            "threshold2": null,
            "threshold2Color": "rgba(234, 112, 112, 0.22)"
          },
          "id": 1,
          "isNew": true,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null as zero",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "alias": "{{CacheClusterId}}_CPUUtilization",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId",
                "CacheNodeId": "$cachenodeid"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "CPUUtilization",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "A",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            }
          ],
          "timeFrom": null,
          "timeShift": null,
          "title": "CacheNodeId $cachenodeid CPUUtilization",
          "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "show": true
          },
          "yaxes": [
            {
              "format": "percent",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": 0,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ]
        }
      ]
    },
    {
      "title": "New row",
      "height": "250px",
      "editable": true,
      "collapse": false,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "${name_prefix}-${environment}",
          "decimals": 3,
          "editable": true,
          "error": false,
          "fill": 1,
          "grid": {
            "threshold1": null,
            "threshold1Color": "rgba(216, 200, 27, 0.27)",
            "threshold2": null,
            "threshold2Color": "rgba(234, 112, 112, 0.22)"
          },
          "id": 10,
          "isNew": true,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null as zero",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "NetworkBytesIn_Average",
              "yaxis": 2
            }
          ],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "alias": "{{CacheClusterId}}_NetworkBytesIn",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId",
                "CacheNodeId": "$cachenodeid"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "NetworkBytesIn",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "A",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            },
            {
              "alias": "{{CacheClusterId}}_NetworkBytesOut",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId",
                "CacheNodeId": "$cachenodeid"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "NetworkBytesOut",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "B",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            }
          ],
          "timeFrom": null,
          "timeShift": null,
          "title": "CacheNodeId $cachenodeid NetworkBytes",
          "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "show": true
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": 0,
              "show": true
            },
            {
              "format": "bytes",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": 0,
              "show": true
            }
          ]
        }
      ]
    },
    {
      "title": "New row",
      "height": "250px",
      "editable": true,
      "collapse": false,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "${name_prefix}-${environment}",
          "decimals": 3,
          "editable": true,
          "error": false,
          "fill": 1,
          "grid": {
            "threshold1": null,
            "threshold1Color": "rgba(216, 200, 27, 0.27)",
            "threshold2": null,
            "threshold2Color": "rgba(234, 112, 112, 0.22)"
          },
          "id": 11,
          "isNew": true,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null as zero",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "FreeableMemory_Average",
              "yaxis": 2
            }
          ],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "alias": "{{CacheClusterId}}_SwapUsage",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId",
                "CacheNodeId": "$cachenodeid"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "SwapUsage",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "A",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            },
            {
              "alias": "{{CacheClusterId}}_FreeableMemory",
              "application": {
                "filter": ""
              },
              "dimensions": {
                "CacheClusterId": "$cacheclusterId",
                "CacheNodeId": "$cachenodeid"
              },
              "functions": [],
              "group": {
                "filter": ""
              },
              "host": {
                "filter": ""
              },
              "item": {
                "filter": ""
              },
              "metricName": "FreeableMemory",
              "mode": 0,
              "namespace": "AWS/ElastiCache",
              "options": {
                "showDisabledItems": false
              },
              "period": "",
              "refId": "B",
              "region": "${region}",
              "statistics": [
                "Average"
              ]
            }
          ],
          "timeFrom": null,
          "timeShift": null,
          "title": "CacheNodeId $cachenodeid FreeableMemory / SwapUsage",
          "tooltip": {
            "msResolution": false,
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "show": true
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": 0,
              "show": true
            },
            {
              "format": "bytes",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": 0,
              "show": true
            }
          ]
        }
      ]
    }
  ],
  "time": {
    "from": "now-24h",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "templating": {
    "list": [
      {
        "current": {},
        "datasource": "${name_prefix}-${environment}",
        "hide": 2,
        "includeAll": false,
        "label": "CacheClusterId",
        "multi": false,
        "name": "cacheclusterId",
        "options": [],
        "query": "dimension_values(${region},AWS/ElastiCache,CPUUtilization,CacheClusterId)",
        "regex": "${cache_name_filter}",
        "refresh": 1,
        "type": "query"
      },
      {
        "current": {},
        "datasource": "${name_prefix}-${environment}",
        "hide": 2,
        "includeAll": true,
        "label": "CacheNodeId",
        "multi": true,
        "name": "cachenodeid",
        "options": [],
        "query": "dimension_values(${region},AWS/ElastiCache,CPUUtilization,CacheNodeId)",
        "refresh": 1,
        "type": "query"
      }
    ]
  },
  "annotations": {
    "list": []
  },
  "refresh": false,
  "schemaVersion": 12,
  "version": 20,
  "links": [],
  "gnetId": 593
}