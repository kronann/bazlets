load("//tools:maven_jar.bzl", "maven_jar")
load("//:bouncycastle.bzl", "bouncycastle_repos")

"""Bazel rule for building [Gerrit Code Review](https://www.gerritcodereview.com/)
gerrit_api is rule for fetching Gerrit plugin API using Bazel.
"""

VER = "2.14.4"

def gerrit_api():
  bouncycastle_repos()

  maven_jar(
   name = 'gerrit_plugin_api',
   artifact = 'com.google.gerrit:gerrit-plugin-api:' + VER,
   sha1 = 'b97fc7e4b70e337aa25f8f46a11b905c3ee7c9b5',
  )
  maven_jar(
    name = 'gerrit_plugin_gwtui',
    artifact = 'com.google.gerrit:gerrit-plugin-gwtui:' + VER,
    sha1 = 'd42a320fb2405191bf7764147a962e3f01fefe2e',
  )
  maven_jar(
    name = 'gerrit_acceptance_framework',
    artifact = 'com.google.gerrit:gerrit-acceptance-framework:' + VER,
    sha1 = 'e79f2abc2b960af5b74a47fff8d6e8f5e74df3d4',
  )
  native.bind(
    name = 'gerrit-plugin-api',
    actual = '@gerrit_plugin_api//jar')
  native.bind(
    name = 'gerrit-plugin-gwtui',
    actual = '@gerrit_plugin_gwtui//jar')
  native.bind(
    name = 'gerrit-acceptance-framework',
    actual = '@gerrit_acceptance_framework//jar')
  native.bind(
    name = 'gerrit-plugin-api-neverlink',
    actual = '@gerrit_plugin_api//jar:neverlink')
  native.bind(
    name = 'gerrit-plugin-gwtui-neverlink',
    actual = '@gerrit_plugin_gwtui//jar:neverlink')
  native.bind(
    name = 'gerrit-acceptance-framework-neverlink',
    actual = '@gerrit_acceptance_framework//jar:neverlink')
