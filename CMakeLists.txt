cmake_minimum_required(VERSION 3.14)
project(KDataFrame VERSION 0.0.1 LANGUAGES CXX)

include(GNUInstallDirs)

# ヘッダオンリーライブラリ
add_library(KDataFrame INTERFACE)

# インクルードパスの設定
target_include_directories(KDataFrame INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>
)

# ヘッダファイルをインストール
install(DIRECTORY header/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

# ライブラリのエクスポート設定
install(TARGETS KDataFrame EXPORT KDataFrameTargets)

# ターゲットをエクスポート
install(EXPORT KDataFrameTargets
  FILE KDataFrameTargets.cmake
  NAMESPACE KBA::
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/KDataFrame
)

# バージョン・構成ファイル生成
include(CMakePackageConfigHelpers)

write_basic_package_version_file(
  "${CMAKE_CURRENT_BINARY_DIR}/KDataFrameConfigVersion.cmake"
  VERSION ${PROJECT_VERSION}
  COMPATIBILITY SameMajorVersion
)

configure_package_config_file(
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake/KDataFrameConfig.cmake.in"
  "${CMAKE_CURRENT_BINARY_DIR}/KDataFrameConfig.cmake"
  INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/KDataFrame
)

install(FILES
  "${CMAKE_CURRENT_BINARY_DIR}/KDataFrameConfig.cmake"
  "${CMAKE_CURRENT_BINARY_DIR}/KDataFrameConfigVersion.cmake"
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/KDataFrame
)
