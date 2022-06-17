qtc_copy_to_builddir(copy_welcomepage
  DESTINATION "${IDE_DATA_PATH}"
  DIRECTORIES qmldesigner
  CREATE_SUBDIRS
)

install(DIRECTORY qmldesigner DESTINATION "${IDE_DATA_PATH}")
