#!/bin/bash

helm lint helm-chart-sources/*

helm package helm-chart-sources/*

#helm repo index --url https://domibydzovsky.github.io/wagtail-chart/ .
helm repo index --url https://domibydzovsky.github.io/wagtail-chart/ --merge index.yaml .