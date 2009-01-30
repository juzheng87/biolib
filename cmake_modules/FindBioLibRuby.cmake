# - Find BioLib for Ruby settings
#
# Expects M_NAME, M_VERSION to be set!

SET (M_MODULE ${M_NAME})

message("Creating Ruby module ${M_MODULE} (${M_VERSION})")
FIND_PACKAGE(BioLib)
FIND_PACKAGE(Ruby)

INCLUDE_DIRECTORIES(${RUBY_INCLUDE_PATH})
SET (RUBY_LIB_PATH ${RUBY_INCLUDE_PATH})

SET (MODULE_SOURCE_PATH ${BIOLIB_CLIBS_PATH}/${M_NAME}-${M_VERSION})

IF(BUILD_LIBS)
  SET(MODULE_LIBRARY biolib_${M_NAME}-${BIOLIB_VERSION})
ELSE(BUILD_LIBS)
  FIND_LIBRARY(MODULE_LIBRARY NAMES libbiolib_${M_NAME}-${BIOLIB_VERSION}.so PATHS ${MODULE_SOURCE_PATH} ${MODULE_SOURCE_PATH}/src)
ENDIF(BUILD_LIBS)
message("MODULE_LIBRARY=${MODULE_LIBRARY}")
INCLUDE_DIRECTORIES(${MODULE_SOURCE_PATH}/include)
INCLUDE_DIRECTORIES(${MODULE_SOURCE_PATH}/src)
INCLUDE_DIRECTORIES(${MODULE_SOURCE_PATH})
IF(USE_INCLUDE)
  INCLUDE_DIRECTORIES(${MODULE_SOURCE_PATH}/${USE_INCLUDE})
ENDIF(USE_INCLUDE)

# temporary hack:
INCLUDE_DIRECTORIES(/usr/include) 
INCLUDE_DIRECTORIES(/usr/lib/gcc/i486-linux-gnu/4.2/include)
# CMakeBackwardCompatibilityC

# ---- Using libraries

IF(USE_RLIB)
  SET (USE_BIOLIBCORE TRUE)
  FIND_PACKAGE(RLibs)
ENDIF(USE_RLIB)

IF(USE_ZLIB)
  SET (USE_BIOLIBCORE TRUE)
  FIND_PACKAGE(ZLIB)
ENDIF(USE_ZLIB)

IF(USE_BIOLIBCORE)
  add_definitions(-DBIOLIB)
	INCLUDE_DIRECTORIES(${BIOLIB_CLIBS_PATH}/biolib_core/include)
	if(NOT BUILD_LIBS)
    FIND_LIBRARY(BIOLIB_LIBRARY NAMES libbiolib_core-${BIOLIB_VERSION}.so PATHS ${BIOLIB_CLIBS_PATH}/biolib_core/src)
	  message("Found ${BIOLIB_LIBRARY}")
  endif(NOT BUILD_LIBS)
ENDIF(USE_BIOLIBCORE)

# ---- SWIG for Ruby:

FIND_PACKAGE(SWIG REQUIRED)
INCLUDE(${SWIG_USE_FILE})

SET_SOURCE_FILES_PROPERTIES(${INTERFACE} PROPERTIES CPLUSPLUS ON)
# SET_SOURCE_FILES_PROPERTIES(${INTERFACE} PROPERTIES SWIG_FLAGS "-includeall;-prefix;'biolib::'")
SET_SOURCE_FILES_PROPERTIES(${INTERFACE} PROPERTIES SWIG_FLAGS "-prefix;'biolib::'")

SWIG_ADD_MODULE(${M_MODULE} ruby ${INTERFACE} ${SOURCES} )
SWIG_LINK_LIBRARIES(${M_MODULE} ${MODULE_LIBRARY} ${RUBY_LIBRARY} ${BIOLIB_LIBRARY} ${R_LIBRARY} ${ZLIB_LIBRARY})

IF(USE_RLIB)
  # handle the QUIETLY and REQUIRED arguments and set RLIBS_FOUND to TRUE if 
  # all listed variables are TRUE
  INCLUDE(FindPackageHandleStandardArgs)
  FIND_PACKAGE_HANDLE_STANDARD_ARGS(RLibs DEFAULT_MSG BIOLIB_RUBY_VERSION)
ENDIF(USE_RLIB)

MESSAGE("BIOLIB_RUBY_VERSION=${BIOLIB_VERSION}")
MESSAGE("RUBY_LIB_PATH=${RUBY_LIB_PATH}")

MARK_AS_ADVANCED(
  BIOLIB_RUBY_VERSION
  )


