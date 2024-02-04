cmake_minimum_required(VERSION 3.13)
project(wshot
    VERSION      1.0.4
    DESCRIPTION  "Screenshot tool for wayland"
    HOMEPAGE_URL "https://github.com/stefonarch/wshot"
)
string(TOLOWER ${PROJECT_NAME} PROJECT_ID)
set(PROJECT_BRIEF        "Screenshot tool")
set(PROJECT_CATEGORIES   "Graphics;Utility;")
set(PROJECT_COMMAND_LINE "bash -c \"wshot &\"")
set(PROJECT_KEYWORDS     "screenshot;wayland;")
set(PROJECT_FILES
    wshot.sh
    wshot.desktop.in
    README.md
    .editorconfig
)
source_group("" FILES ${PROJECT_FILES})
add_custom_target(include SOURCES ${PROJECT_FILES})

configure_file(wshot.desktop.in ${CMAKE_BINARY_DIR}/wshot.desktop @ONLY)
#===================================================================================================
# Translations
#===================================================================================================
find_package(Gettext REQUIRED)
file(GLOB PROJECT_TRANSLATIONS "${CMAKE_SOURCE_DIR}/translations/*.po")
gettext_create_translations("${CMAKE_SOURCE_DIR}/translations/${PROJECT_ID}.pot" ALL "${PROJECT_TRANSLATIONS}")
#===================================================================================================
# Install
#===================================================================================================
include(GNUInstallDirs)
install(
    FILES       "${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_ID}.sh"
    DESTINATION "${CMAKE_INSTALL_FULL_BINDIR}"
    RENAME      ${PROJECT_ID}
    PERMISSIONS
        OWNER_READ OWNER_EXECUTE OWNER_WRITE
        GROUP_READ GROUP_EXECUTE
        WORLD_READ WORLD_EXECUTE
)
install(
    FILES       "${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_ID}.png"
    DESTINATION "${CMAKE_INSTALL_FULL_DATADIR}/pixmaps"
)
install(
    FILES       "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_ID}.desktop"
    DESTINATION "${CMAKE_INSTALL_FULL_DATADIR}/applications"
)
install(
    FILES
        "${CMAKE_CURRENT_SOURCE_DIR}/README.md"
        "${CMAKE_CURRENT_SOURCE_DIR}/wshot1.png"
    DESTINATION
        "${CMAKE_INSTALL_FULL_DOCDIR}"
)
