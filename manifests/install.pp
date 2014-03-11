# == Class phpapc::install
#
class phpapc::install ($package) {
  ensure_packages([$package])
}
