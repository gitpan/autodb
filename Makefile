# This Makefile is for the Class::AutoDB extension to perl.
#
# It was generated automatically by MakeMaker version
# 6.17 (Revision: 1.133) from the contents of
# Makefile.PL. Don't edit this file, edit Makefile.PL instead.
#
#       ANY CHANGES MADE HERE WILL BE LOST!
#
#   MakeMaker ARGV: ()
#
#   MakeMaker Parameters:

#     NAME => q[Class::AutoDB]
#     PREREQ_PM => { Text::Abbrev=>q[0], YAML=>q[0], IO::Scalar=>q[2.104], Data::Dumper=>q[2.12], Storable=>q[2.06], Set::Scalar=>q[0], Class::Singleton=>q[0], Test::More=>q[0.45], Error=>q[0.15], DBD::mysql=>q[2.9002], Class::AutoClass=>q[0.09], Class::WeakSingleton=>q[1.03], Test::Deep=>q[0] }
#     VERSION_FROM => q[lib/Class/AutoDB.pm]

# --- MakeMaker post_initialize section:


# --- MakeMaker const_config section:

# These definitions are from config.sh (via /jdrf_tools/lib/perl5/5.8.5/i686-linux-thread-multi/Config.pm)

# They may have been overridden via Makefile.PL or on the command line
AR = ar
CC = gcc
CCCDLFLAGS = -fpic
CCDLFLAGS = -Wl,-E -Wl,-rpath,/jdrf_tools/lib/perl5/5.8.5/i686-linux-thread-multi/CORE
DLEXT = so
DLSRC = dl_dlopen.xs
LD = gcc
LDDLFLAGS = -shared -L/usr/local/lib
LDFLAGS =  -L/usr/local/lib
LIBC = /lib/libc-2.3.2.so
LIB_EXT = .a
OBJ_EXT = .o
OSNAME = linux
OSVERS = 2.4.21-15.0.3.elsmp
RANLIB = :
SITELIBEXP = /jdrf_tools/lib/perl5/site_perl/5.8.5
SITEARCHEXP = /jdrf_tools/lib/perl5/site_perl/5.8.5/i686-linux-thread-multi
SO = so
EXE_EXT = 
FULL_AR = /usr/bin/ar
VENDORARCHEXP = 
VENDORLIBEXP = 


# --- MakeMaker constants section:
AR_STATIC_ARGS = cr
DIRFILESEP = /
NAME = Class::AutoDB
NAME_SYM = Class_AutoDB
VERSION = 0.1
VERSION_MACRO = VERSION
VERSION_SYM = 0_1
DEFINE_VERSION = -D$(VERSION_MACRO)=\"$(VERSION)\"
XS_VERSION = 0.1
XS_VERSION_MACRO = XS_VERSION
XS_DEFINE_VERSION = -D$(XS_VERSION_MACRO)=\"$(XS_VERSION)\"
INST_ARCHLIB = blib/arch
INST_SCRIPT = blib/script
INST_BIN = blib/bin
INST_LIB = blib/lib
INST_MAN1DIR = blib/man1
INST_MAN3DIR = blib/man3
MAN1EXT = 1
MAN3EXT = 3pm
INSTALLDIRS = site
DESTDIR = 
PREFIX = 
PERLPREFIX = /jdrf_tools
SITEPREFIX = /jdrf_tools
VENDORPREFIX = 
INSTALLPRIVLIB = $(PERLPREFIX)/lib/perl5/5.8.5
DESTINSTALLPRIVLIB = $(DESTDIR)$(INSTALLPRIVLIB)
INSTALLSITELIB = $(SITEPREFIX)/lib/perl5/site_perl/5.8.5
DESTINSTALLSITELIB = $(DESTDIR)$(INSTALLSITELIB)
INSTALLVENDORLIB = 
DESTINSTALLVENDORLIB = $(DESTDIR)$(INSTALLVENDORLIB)
INSTALLARCHLIB = $(PERLPREFIX)/lib/perl5/5.8.5/i686-linux-thread-multi
DESTINSTALLARCHLIB = $(DESTDIR)$(INSTALLARCHLIB)
INSTALLSITEARCH = $(SITEPREFIX)/lib/perl5/site_perl/5.8.5/i686-linux-thread-multi
DESTINSTALLSITEARCH = $(DESTDIR)$(INSTALLSITEARCH)
INSTALLVENDORARCH = 
DESTINSTALLVENDORARCH = $(DESTDIR)$(INSTALLVENDORARCH)
INSTALLBIN = $(PERLPREFIX)/bin
DESTINSTALLBIN = $(DESTDIR)$(INSTALLBIN)
INSTALLSITEBIN = $(SITEPREFIX)/bin
DESTINSTALLSITEBIN = $(DESTDIR)$(INSTALLSITEBIN)
INSTALLVENDORBIN = 
DESTINSTALLVENDORBIN = $(DESTDIR)$(INSTALLVENDORBIN)
INSTALLSCRIPT = $(PERLPREFIX)/bin
DESTINSTALLSCRIPT = $(DESTDIR)$(INSTALLSCRIPT)
INSTALLMAN1DIR = $(PERLPREFIX)/man/man1
DESTINSTALLMAN1DIR = $(DESTDIR)$(INSTALLMAN1DIR)
INSTALLSITEMAN1DIR = $(SITEPREFIX)/man/man1
DESTINSTALLSITEMAN1DIR = $(DESTDIR)$(INSTALLSITEMAN1DIR)
INSTALLVENDORMAN1DIR = 
DESTINSTALLVENDORMAN1DIR = $(DESTDIR)$(INSTALLVENDORMAN1DIR)
INSTALLMAN3DIR = $(PERLPREFIX)/man/man3
DESTINSTALLMAN3DIR = $(DESTDIR)$(INSTALLMAN3DIR)
INSTALLSITEMAN3DIR = $(SITEPREFIX)/man/man3
DESTINSTALLSITEMAN3DIR = $(DESTDIR)$(INSTALLSITEMAN3DIR)
INSTALLVENDORMAN3DIR = 
DESTINSTALLVENDORMAN3DIR = $(DESTDIR)$(INSTALLVENDORMAN3DIR)
PERL_LIB = /jdrf_tools/lib/perl5/5.8.5
PERL_ARCHLIB = /jdrf_tools/lib/perl5/5.8.5/i686-linux-thread-multi
LIBPERL_A = libperl.a
FIRST_MAKEFILE = Makefile
MAKEFILE_OLD = $(FIRST_MAKEFILE).old
MAKE_APERL_FILE = $(FIRST_MAKEFILE).aperl
PERLMAINCC = $(CC)
PERL_INC = /jdrf_tools/lib/perl5/5.8.5/i686-linux-thread-multi/CORE
PERL = /export/jdrf_tools/ARCH/i686/bin/perl
FULLPERL = /export/jdrf_tools/ARCH/i686/bin/perl
ABSPERL = $(PERL)
PERLRUN = $(PERL)
FULLPERLRUN = $(FULLPERL)
ABSPERLRUN = $(ABSPERL)
PERLRUNINST = $(PERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"
FULLPERLRUNINST = $(FULLPERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"
ABSPERLRUNINST = $(ABSPERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"
PERL_CORE = 0
PERM_RW = 644
PERM_RWX = 755

MAKEMAKER   = /jdrf_tools/lib/perl5/5.8.5/ExtUtils/MakeMaker.pm
MM_VERSION  = 6.17
MM_REVISION = 1.133

# FULLEXT = Pathname for extension directory (eg Foo/Bar/Oracle).
# BASEEXT = Basename part of FULLEXT. May be just equal FULLEXT. (eg Oracle)
# PARENT_NAME = NAME without BASEEXT and no trailing :: (eg Foo::Bar)
# DLBASE  = Basename part of dynamic library. May be just equal BASEEXT.
FULLEXT = Class/AutoDB
BASEEXT = AutoDB
PARENT_NAME = Class
DLBASE = $(BASEEXT)
VERSION_FROM = lib/Class/AutoDB.pm
OBJECT = 
LDFROM = $(OBJECT)
LINKTYPE = dynamic

# Handy lists of source code files:
XS_FILES = 
C_FILES  = 
O_FILES  = 
H_FILES  = 
MAN1PODS = 
MAN3PODS = lib/Class/AutoDB.pm \
	lib/Class/AutoDB/Collection.pm \
	lib/Class/AutoDB/CollectionDiff.pm \
	lib/Class/AutoDB/Registration.pm \
	lib/Class/AutoDB/Registry.pm \
	lib/Class/AutoDB/RegistryDiff.pod \
	lib/Class/AutoDB/Serialize.pm \
	lib/Class/AutoDB/Table.pm

# Where is the Config information that we are using/depend on
CONFIGDEP = $(PERL_ARCHLIB)$(DIRFILESEP)Config.pm $(PERL_INC)$(DIRFILESEP)config.h

# Where to build things
INST_LIBDIR      = $(INST_LIB)/Class
INST_ARCHLIBDIR  = $(INST_ARCHLIB)/Class

INST_AUTODIR     = $(INST_LIB)/auto/$(FULLEXT)
INST_ARCHAUTODIR = $(INST_ARCHLIB)/auto/$(FULLEXT)

INST_STATIC      = 
INST_DYNAMIC     = 
INST_BOOT        = 

# Extra linker info
EXPORT_LIST        = 
PERL_ARCHIVE       = 
PERL_ARCHIVE_AFTER = 


TO_INST_PM = lib/Class/AutoDB.pm \
	lib/Class/AutoDB/AutoDB.sql \
	lib/Class/AutoDB/BaseTable.pm \
	lib/Class/AutoDB/Collection.pm \
	lib/Class/AutoDB/CollectionDiff.pm \
	lib/Class/AutoDB/Connect.pm \
	lib/Class/AutoDB/Cursor.pm \
	lib/Class/AutoDB/Database.pm \
	lib/Class/AutoDB/Globals.pm \
	lib/Class/AutoDB/ListTable.pm \
	lib/Class/AutoDB/Object.pm \
	lib/Class/AutoDB/Object.sql \
	lib/Class/AutoDB/Oid.pm \
	lib/Class/AutoDB/Registration.pm \
	lib/Class/AutoDB/Registry.pm \
	lib/Class/AutoDB/RegistryDiff.pm \
	lib/Class/AutoDB/RegistryDiff.pod \
	lib/Class/AutoDB/RegistryVersion.pm \
	lib/Class/AutoDB/Serialize.pm \
	lib/Class/AutoDB/Table.pm

PM_TO_BLIB = lib/Class/AutoDB/Connect.pm \
	blib/lib/Class/AutoDB/Connect.pm \
	lib/Class/AutoDB/RegistryDiff.pod \
	blib/lib/Class/AutoDB/RegistryDiff.pod \
	lib/Class/AutoDB/Registration.pm \
	blib/lib/Class/AutoDB/Registration.pm \
	lib/Class/AutoDB/Table.pm \
	blib/lib/Class/AutoDB/Table.pm \
	lib/Class/AutoDB/Oid.pm \
	blib/lib/Class/AutoDB/Oid.pm \
	lib/Class/AutoDB/CollectionDiff.pm \
	blib/lib/Class/AutoDB/CollectionDiff.pm \
	lib/Class/AutoDB/Collection.pm \
	blib/lib/Class/AutoDB/Collection.pm \
	lib/Class/AutoDB/Object.pm \
	blib/lib/Class/AutoDB/Object.pm \
	lib/Class/AutoDB/BaseTable.pm \
	blib/lib/Class/AutoDB/BaseTable.pm \
	lib/Class/AutoDB.pm \
	blib/lib/Class/AutoDB.pm \
	lib/Class/AutoDB/RegistryDiff.pm \
	blib/lib/Class/AutoDB/RegistryDiff.pm \
	lib/Class/AutoDB/Serialize.pm \
	blib/lib/Class/AutoDB/Serialize.pm \
	lib/Class/AutoDB/AutoDB.sql \
	blib/lib/Class/AutoDB/AutoDB.sql \
	lib/Class/AutoDB/Globals.pm \
	blib/lib/Class/AutoDB/Globals.pm \
	lib/Class/AutoDB/Object.sql \
	blib/lib/Class/AutoDB/Object.sql \
	lib/Class/AutoDB/Database.pm \
	blib/lib/Class/AutoDB/Database.pm \
	lib/Class/AutoDB/RegistryVersion.pm \
	blib/lib/Class/AutoDB/RegistryVersion.pm \
	lib/Class/AutoDB/Cursor.pm \
	blib/lib/Class/AutoDB/Cursor.pm \
	lib/Class/AutoDB/ListTable.pm \
	blib/lib/Class/AutoDB/ListTable.pm \
	lib/Class/AutoDB/Registry.pm \
	blib/lib/Class/AutoDB/Registry.pm


# --- MakeMaker platform_constants section:
MM_Unix_VERSION = 1.42
PERL_MALLOC_DEF = -DPERL_EXTMALLOC_DEF -Dmalloc=Perl_malloc -Dfree=Perl_mfree -Drealloc=Perl_realloc -Dcalloc=Perl_calloc


# --- MakeMaker tool_autosplit section:
# Usage: $(AUTOSPLITFILE) FileToSplit AutoDirToSplitInto
AUTOSPLITFILE = $(PERLRUN)  -e 'use AutoSplit;  autosplit($$ARGV[0], $$ARGV[1], 0, 1, 1)'



# --- MakeMaker tool_xsubpp section:


# --- MakeMaker tools_other section:
SHELL = /bin/sh
CHMOD = chmod
CP = cp
MV = mv
NOOP = $(SHELL) -c true
NOECHO = @
RM_F = rm -f
RM_RF = rm -rf
TEST_F = test -f
TOUCH = touch
UMASK_NULL = umask 0
DEV_NULL = > /dev/null 2>&1
MKPATH = $(PERLRUN) "-MExtUtils::Command" -e mkpath
EQUALIZE_TIMESTAMP = $(PERLRUN) "-MExtUtils::Command" -e eqtime
ECHO = echo
ECHO_N = echo -n
UNINST = 0
VERBINST = 0
MOD_INSTALL = $(PERLRUN) -MExtUtils::Install -e 'install({@ARGV}, '\''$(VERBINST)'\'', 0, '\''$(UNINST)'\'');'
DOC_INSTALL = $(PERLRUN) "-MExtUtils::Command::MM" -e perllocal_install
UNINSTALL = $(PERLRUN) "-MExtUtils::Command::MM" -e uninstall
WARN_IF_OLD_PACKLIST = $(PERLRUN) "-MExtUtils::Command::MM" -e warn_if_old_packlist


# --- MakeMaker makemakerdflt section:
makemakerdflt: all
	$(NOECHO) $(NOOP)


# --- MakeMaker dist section:
TAR = tar
TARFLAGS = cvf
ZIP = zip
ZIPFLAGS = -r
COMPRESS = gzip --best
SUFFIX = .gz
SHAR = shar
PREOP = $(NOECHO) $(NOOP)
POSTOP = $(NOECHO) $(NOOP)
TO_UNIX = $(NOECHO) $(NOOP)
CI = ci -u
RCS_LABEL = rcs -Nv$(VERSION_SYM): -q
DIST_CP = best
DIST_DEFAULT = tardist
DISTNAME = Class-AutoDB
DISTVNAME = Class-AutoDB-0.1


# --- MakeMaker macro section:


# --- MakeMaker depend section:


# --- MakeMaker cflags section:


# --- MakeMaker const_loadlibs section:


# --- MakeMaker const_cccmd section:


# --- MakeMaker post_constants section:


# --- MakeMaker pasthru section:

PASTHRU = LIB="$(LIB)"\
	LIBPERL_A="$(LIBPERL_A)"\
	LINKTYPE="$(LINKTYPE)"\
	PREFIX="$(PREFIX)"\
	OPTIMIZE="$(OPTIMIZE)"\
	PASTHRU_DEFINE="$(PASTHRU_DEFINE)"\
	PASTHRU_INC="$(PASTHRU_INC)"


# --- MakeMaker special_targets section:
.SUFFIXES: .xs .c .C .cpp .i .s .cxx .cc $(OBJ_EXT)

.PHONY: all config static dynamic test linkext manifest



# --- MakeMaker c_o section:


# --- MakeMaker xs_c section:


# --- MakeMaker xs_o section:


# --- MakeMaker top_targets section:
all :: pure_all manifypods
	$(NOECHO) $(NOOP)


pure_all :: config pm_to_blib subdirs linkext
	$(NOECHO) $(NOOP)

subdirs :: $(MYEXTLIB)
	$(NOECHO) $(NOOP)

config :: $(FIRST_MAKEFILE) $(INST_LIBDIR)$(DIRFILESEP).exists
	$(NOECHO) $(NOOP)

config :: $(INST_ARCHAUTODIR)$(DIRFILESEP).exists
	$(NOECHO) $(NOOP)

config :: $(INST_AUTODIR)$(DIRFILESEP).exists
	$(NOECHO) $(NOOP)

$(INST_AUTODIR)/.exists :: /jdrf_tools/lib/perl5/5.8.5/i686-linux-thread-multi/CORE/perl.h
	$(NOECHO) $(MKPATH) $(INST_AUTODIR)
	$(NOECHO) $(EQUALIZE_TIMESTAMP) /jdrf_tools/lib/perl5/5.8.5/i686-linux-thread-multi/CORE/perl.h $(INST_AUTODIR)/.exists

	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_AUTODIR)

$(INST_LIBDIR)/.exists :: /jdrf_tools/lib/perl5/5.8.5/i686-linux-thread-multi/CORE/perl.h
	$(NOECHO) $(MKPATH) $(INST_LIBDIR)
	$(NOECHO) $(EQUALIZE_TIMESTAMP) /jdrf_tools/lib/perl5/5.8.5/i686-linux-thread-multi/CORE/perl.h $(INST_LIBDIR)/.exists

	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_LIBDIR)

$(INST_ARCHAUTODIR)/.exists :: /jdrf_tools/lib/perl5/5.8.5/i686-linux-thread-multi/CORE/perl.h
	$(NOECHO) $(MKPATH) $(INST_ARCHAUTODIR)
	$(NOECHO) $(EQUALIZE_TIMESTAMP) /jdrf_tools/lib/perl5/5.8.5/i686-linux-thread-multi/CORE/perl.h $(INST_ARCHAUTODIR)/.exists

	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_ARCHAUTODIR)

config :: $(INST_MAN3DIR)$(DIRFILESEP).exists
	$(NOECHO) $(NOOP)


$(INST_MAN3DIR)/.exists :: /jdrf_tools/lib/perl5/5.8.5/i686-linux-thread-multi/CORE/perl.h
	$(NOECHO) $(MKPATH) $(INST_MAN3DIR)
	$(NOECHO) $(EQUALIZE_TIMESTAMP) /jdrf_tools/lib/perl5/5.8.5/i686-linux-thread-multi/CORE/perl.h $(INST_MAN3DIR)/.exists

	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_MAN3DIR)

help:
	perldoc ExtUtils::MakeMaker


# --- MakeMaker linkext section:

linkext :: $(LINKTYPE)
	$(NOECHO) $(NOOP)


# --- MakeMaker dlsyms section:


# --- MakeMaker dynamic section:

dynamic :: $(FIRST_MAKEFILE) $(INST_DYNAMIC) $(INST_BOOT)
	$(NOECHO) $(NOOP)


# --- MakeMaker dynamic_bs section:

BOOTSTRAP =


# --- MakeMaker dynamic_lib section:


# --- MakeMaker static section:

## $(INST_PM) has been moved to the all: target.
## It remains here for awhile to allow for old usage: "make static"
static :: $(FIRST_MAKEFILE) $(INST_STATIC)
	$(NOECHO) $(NOOP)


# --- MakeMaker static_lib section:


# --- MakeMaker manifypods section:

POD2MAN_EXE = $(PERLRUN) "-MExtUtils::Command::MM" -e pod2man "--"
POD2MAN = $(POD2MAN_EXE)


manifypods : pure_all  \
	lib/Class/AutoDB/Collection.pm \
	lib/Class/AutoDB.pm \
	lib/Class/AutoDB/RegistryDiff.pod \
	lib/Class/AutoDB/Registration.pm \
	lib/Class/AutoDB/Table.pm \
	lib/Class/AutoDB/Serialize.pm \
	lib/Class/AutoDB/CollectionDiff.pm \
	lib/Class/AutoDB/Registry.pm \
	lib/Class/AutoDB/Collection.pm \
	lib/Class/AutoDB.pm \
	lib/Class/AutoDB/RegistryDiff.pod \
	lib/Class/AutoDB/Registration.pm \
	lib/Class/AutoDB/Table.pm \
	lib/Class/AutoDB/Serialize.pm \
	lib/Class/AutoDB/CollectionDiff.pm \
	lib/Class/AutoDB/Registry.pm
	$(NOECHO) $(POD2MAN) --section=3 --perm_rw=$(PERM_RW)\
	  lib/Class/AutoDB/Collection.pm $(INST_MAN3DIR)/Class::AutoDB::Collection.$(MAN3EXT) \
	  lib/Class/AutoDB.pm $(INST_MAN3DIR)/Class::AutoDB.$(MAN3EXT) \
	  lib/Class/AutoDB/RegistryDiff.pod $(INST_MAN3DIR)/Class::AutoDB::RegistryDiff.$(MAN3EXT) \
	  lib/Class/AutoDB/Registration.pm $(INST_MAN3DIR)/Class::AutoDB::Registration.$(MAN3EXT) \
	  lib/Class/AutoDB/Table.pm $(INST_MAN3DIR)/Class::AutoDB::Table.$(MAN3EXT) \
	  lib/Class/AutoDB/Serialize.pm $(INST_MAN3DIR)/Class::AutoDB::Serialize.$(MAN3EXT) \
	  lib/Class/AutoDB/CollectionDiff.pm $(INST_MAN3DIR)/Class::AutoDB::CollectionDiff.$(MAN3EXT) \
	  lib/Class/AutoDB/Registry.pm $(INST_MAN3DIR)/Class::AutoDB::Registry.$(MAN3EXT) 




# --- MakeMaker processPL section:


# --- MakeMaker installbin section:


# --- MakeMaker subdirs section:

# none

# --- MakeMaker clean_subdirs section:
clean_subdirs :
	$(NOECHO) $(NOOP)


# --- MakeMaker clean section:

# Delete temporary files but do not touch installed files. We don't delete
# the Makefile here so a later make realclean still has a makefile to use.

clean :: clean_subdirs
	-$(RM_RF) ./blib $(MAKE_APERL_FILE) $(INST_ARCHAUTODIR)/extralibs.all $(INST_ARCHAUTODIR)/extralibs.ld perlmain.c tmon.out mon.out so_locations pm_to_blib *$(OBJ_EXT) *$(LIB_EXT) perl.exe perl perl$(EXE_EXT) $(BOOTSTRAP) $(BASEEXT).bso $(BASEEXT).def lib$(BASEEXT).def $(BASEEXT).exp $(BASEEXT).x core core.*perl.*.? *perl.core core.[0-9] core.[0-9][0-9] core.[0-9][0-9][0-9] core.[0-9][0-9][0-9][0-9] core.[0-9][0-9][0-9][0-9][0-9]
	-$(MV) $(FIRST_MAKEFILE) $(MAKEFILE_OLD) $(DEV_NULL)


# --- MakeMaker realclean_subdirs section:
realclean_subdirs :
	$(NOECHO) $(NOOP)


# --- MakeMaker realclean section:

# Delete temporary files (via clean) and also delete installed files
realclean purge ::  clean realclean_subdirs
	$(RM_RF) $(INST_AUTODIR) $(INST_ARCHAUTODIR)
	$(RM_RF) $(DISTVNAME)
	$(RM_F)  blib/lib/Class/AutoDB/Registration.pm blib/lib/Class/AutoDB/Object.pm blib/lib/Class/AutoDB/AutoDB.sql $(MAKEFILE_OLD) blib/lib/Class/AutoDB/Serialize.pm blib/lib/Class/AutoDB/RegistryVersion.pm
	$(RM_F) blib/lib/Class/AutoDB/CollectionDiff.pm $(FIRST_MAKEFILE) blib/lib/Class/AutoDB/RegistryDiff.pod blib/lib/Class/AutoDB/Collection.pm blib/lib/Class/AutoDB/Registry.pm blib/lib/Class/AutoDB/Globals.pm
	$(RM_F) blib/lib/Class/AutoDB/BaseTable.pm blib/lib/Class/AutoDB/RegistryDiff.pm blib/lib/Class/AutoDB/Database.pm blib/lib/Class/AutoDB/Connect.pm blib/lib/Class/AutoDB/Cursor.pm
	$(RM_F) blib/lib/Class/AutoDB/ListTable.pm blib/lib/Class/AutoDB/Table.pm blib/lib/Class/AutoDB/Object.sql blib/lib/Class/AutoDB.pm blib/lib/Class/AutoDB/Oid.pm


# --- MakeMaker metafile section:
metafile :
	$(NOECHO) $(ECHO) '# http://module-build.sourceforge.net/META-spec.html' > META.yml
	$(NOECHO) $(ECHO) '#XXXXXXX This is a prototype!!!  It will change in the future!!! XXXXX#' >> META.yml
	$(NOECHO) $(ECHO) 'name:         Class-AutoDB' >> META.yml
	$(NOECHO) $(ECHO) 'version:      0.1' >> META.yml
	$(NOECHO) $(ECHO) 'version_from: lib/Class/AutoDB.pm' >> META.yml
	$(NOECHO) $(ECHO) 'installdirs:  site' >> META.yml
	$(NOECHO) $(ECHO) 'requires:' >> META.yml
	$(NOECHO) $(ECHO) '    Class::AutoClass:              0.09' >> META.yml
	$(NOECHO) $(ECHO) '    Class::Singleton:              0' >> META.yml
	$(NOECHO) $(ECHO) '    Class::WeakSingleton:          1.03' >> META.yml
	$(NOECHO) $(ECHO) '    Data::Dumper:                  2.12' >> META.yml
	$(NOECHO) $(ECHO) '    DBD::mysql:                    2.9002' >> META.yml
	$(NOECHO) $(ECHO) '    Error:                         0.15' >> META.yml
	$(NOECHO) $(ECHO) '    IO::Scalar:                    2.104' >> META.yml
	$(NOECHO) $(ECHO) '    Set::Scalar:                   0' >> META.yml
	$(NOECHO) $(ECHO) '    Storable:                      2.06' >> META.yml
	$(NOECHO) $(ECHO) '    Test::Deep:                    0' >> META.yml
	$(NOECHO) $(ECHO) '    Test::More:                    0.45' >> META.yml
	$(NOECHO) $(ECHO) '    Text::Abbrev:                  0' >> META.yml
	$(NOECHO) $(ECHO) '    YAML:                          0' >> META.yml
	$(NOECHO) $(ECHO) '' >> META.yml
	$(NOECHO) $(ECHO) 'distribution_type: module' >> META.yml
	$(NOECHO) $(ECHO) 'generated_by: ExtUtils::MakeMaker version 6.17' >> META.yml


# --- MakeMaker metafile_addtomanifest section:
metafile_addtomanifest:
	$(NOECHO) $(PERLRUN) -MExtUtils::Manifest=maniadd -e 'eval { maniadd({q{META.yml} => q{Module meta-data (added by MakeMaker)}}) } ' \
	-e '    or print "Could not add META.yml to MANIFEST: $${'\''@'\''}\n"'


# --- MakeMaker dist_basics section:
distclean :: realclean distcheck
	$(NOECHO) $(NOOP)

distcheck :
	$(PERLRUN) "-MExtUtils::Manifest=fullcheck" -e fullcheck

skipcheck :
	$(PERLRUN) "-MExtUtils::Manifest=skipcheck" -e skipcheck

manifest :
	$(PERLRUN) "-MExtUtils::Manifest=mkmanifest" -e mkmanifest

veryclean : realclean
	$(RM_F) *~ *.orig */*~ */*.orig



# --- MakeMaker dist_core section:

dist : $(DIST_DEFAULT) $(FIRST_MAKEFILE)
	$(NOECHO) $(PERLRUN) -l -e 'print '\''Warning: Makefile possibly out of date with $(VERSION_FROM)'\''' \
	-e '    if -e '\''$(VERSION_FROM)'\'' and -M '\''$(VERSION_FROM)'\'' < -M '\''$(FIRST_MAKEFILE)'\'';'

tardist : $(DISTVNAME).tar$(SUFFIX)
	$(NOECHO) $(NOOP)

uutardist : $(DISTVNAME).tar$(SUFFIX)
	uuencode $(DISTVNAME).tar$(SUFFIX) $(DISTVNAME).tar$(SUFFIX) > $(DISTVNAME).tar$(SUFFIX)_uu

$(DISTVNAME).tar$(SUFFIX) : distdir
	$(PREOP)
	$(TO_UNIX)
	$(TAR) $(TARFLAGS) $(DISTVNAME).tar $(DISTVNAME)
	$(RM_RF) $(DISTVNAME)
	$(COMPRESS) $(DISTVNAME).tar
	$(POSTOP)

zipdist : $(DISTVNAME).zip
	$(NOECHO) $(NOOP)

$(DISTVNAME).zip : distdir
	$(PREOP)
	$(ZIP) $(ZIPFLAGS) $(DISTVNAME).zip $(DISTVNAME)
	$(RM_RF) $(DISTVNAME)
	$(POSTOP)

shdist : distdir
	$(PREOP)
	$(SHAR) $(DISTVNAME) > $(DISTVNAME).shar
	$(RM_RF) $(DISTVNAME)
	$(POSTOP)


# --- MakeMaker distdir section:
distdir : metafile metafile_addtomanifest
	$(RM_RF) $(DISTVNAME)
	$(PERLRUN) "-MExtUtils::Manifest=manicopy,maniread" \
		-e "manicopy(maniread(),'$(DISTVNAME)', '$(DIST_CP)');"



# --- MakeMaker dist_test section:

disttest : distdir
	cd $(DISTVNAME) && $(ABSPERLRUN) Makefile.PL
	cd $(DISTVNAME) && $(MAKE) $(PASTHRU)
	cd $(DISTVNAME) && $(MAKE) test $(PASTHRU)


# --- MakeMaker dist_ci section:

ci :
	$(PERLRUN) "-MExtUtils::Manifest=maniread" \
	  -e "@all = keys %{ maniread() };" \
	  -e "print(qq{Executing $(CI) @all\n}); system(qq{$(CI) @all});" \
	  -e "print(qq{Executing $(RCS_LABEL) ...\n}); system(qq{$(RCS_LABEL) @all});"


# --- MakeMaker install section:

install :: all pure_install doc_install

install_perl :: all pure_perl_install doc_perl_install

install_site :: all pure_site_install doc_site_install

install_vendor :: all pure_vendor_install doc_vendor_install

pure_install :: pure_$(INSTALLDIRS)_install

doc_install :: doc_$(INSTALLDIRS)_install

pure__install : pure_site_install
	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site

doc__install : doc_site_install
	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site

pure_perl_install ::
	$(NOECHO) $(MOD_INSTALL) \
		read $(PERL_ARCHLIB)/auto/$(FULLEXT)/.packlist \
		write $(DESTINSTALLARCHLIB)/auto/$(FULLEXT)/.packlist \
		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
		$(INST_ARCHLIB) $(DESTINSTALLARCHLIB) \
		$(INST_BIN) $(DESTINSTALLBIN) \
		$(INST_SCRIPT) $(DESTINSTALLSCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLMAN3DIR)
	$(NOECHO) $(WARN_IF_OLD_PACKLIST) \
		$(SITEARCHEXP)/auto/$(FULLEXT)


pure_site_install ::
	$(NOECHO) $(MOD_INSTALL) \
		read $(SITEARCHEXP)/auto/$(FULLEXT)/.packlist \
		write $(DESTINSTALLSITEARCH)/auto/$(FULLEXT)/.packlist \
		$(INST_LIB) $(DESTINSTALLSITELIB) \
		$(INST_ARCHLIB) $(DESTINSTALLSITEARCH) \
		$(INST_BIN) $(DESTINSTALLSITEBIN) \
		$(INST_SCRIPT) $(DESTINSTALLSCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLSITEMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLSITEMAN3DIR)
	$(NOECHO) $(WARN_IF_OLD_PACKLIST) \
		$(PERL_ARCHLIB)/auto/$(FULLEXT)

pure_vendor_install ::
	$(NOECHO) $(MOD_INSTALL) \
		read $(VENDORARCHEXP)/auto/$(FULLEXT)/.packlist \
		write $(DESTINSTALLVENDORARCH)/auto/$(FULLEXT)/.packlist \
		$(INST_LIB) $(DESTINSTALLVENDORLIB) \
		$(INST_ARCHLIB) $(DESTINSTALLVENDORARCH) \
		$(INST_BIN) $(DESTINSTALLVENDORBIN) \
		$(INST_SCRIPT) $(DESTINSTALLSCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLVENDORMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLVENDORMAN3DIR)

doc_perl_install ::
	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
	-$(NOECHO) $(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" "$(INSTALLPRIVLIB)" \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> $(DESTINSTALLARCHLIB)/perllocal.pod

doc_site_install ::
	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
	-$(NOECHO) $(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" "$(INSTALLSITELIB)" \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> $(DESTINSTALLARCHLIB)/perllocal.pod

doc_vendor_install ::
	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
	-$(NOECHO) $(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" "$(INSTALLVENDORLIB)" \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> $(DESTINSTALLARCHLIB)/perllocal.pod


uninstall :: uninstall_from_$(INSTALLDIRS)dirs

uninstall_from_perldirs ::
	$(NOECHO) $(UNINSTALL) $(PERL_ARCHLIB)/auto/$(FULLEXT)/.packlist

uninstall_from_sitedirs ::
	$(NOECHO) $(UNINSTALL) $(SITEARCHEXP)/auto/$(FULLEXT)/.packlist

uninstall_from_vendordirs ::
	$(NOECHO) $(UNINSTALL) $(VENDORARCHEXP)/auto/$(FULLEXT)/.packlist


# --- MakeMaker force section:
# Phony target to force checking subdirectories.
FORCE:
	$(NOECHO) $(NOOP)


# --- MakeMaker perldepend section:


# --- MakeMaker makefile section:

# We take a very conservative approach here, but it's worth it.
# We move Makefile to Makefile.old here to avoid gnu make looping.
$(FIRST_MAKEFILE) : Makefile.PL $(CONFIGDEP)
	$(NOECHO) $(ECHO) "Makefile out-of-date with respect to $?"
	$(NOECHO) $(ECHO) "Cleaning current config before rebuilding Makefile..."
	$(NOECHO) $(RM_F) $(MAKEFILE_OLD)
	$(NOECHO) $(MV)   $(FIRST_MAKEFILE) $(MAKEFILE_OLD)
	-$(MAKE) -f $(MAKEFILE_OLD) clean $(DEV_NULL) || $(NOOP)
	$(PERLRUN) Makefile.PL 
	$(NOECHO) $(ECHO) "==> Your Makefile has been rebuilt. <=="
	$(NOECHO) $(ECHO) "==> Please rerun the make command.  <=="
	false



# --- MakeMaker staticmake section:

# --- MakeMaker makeaperl section ---
MAP_TARGET    = perl
FULLPERL      = /export/jdrf_tools/ARCH/i686/bin/perl

$(MAP_TARGET) :: static $(MAKE_APERL_FILE)
	$(MAKE) -f $(MAKE_APERL_FILE) $@

$(MAKE_APERL_FILE) : $(FIRST_MAKEFILE)
	$(NOECHO) $(ECHO) Writing \"$(MAKE_APERL_FILE)\" for this $(MAP_TARGET)
	$(NOECHO) $(PERLRUNINST) \
		Makefile.PL DIR= \
		MAKEFILE=$(MAKE_APERL_FILE) LINKTYPE=static \
		MAKEAPERL=1 NORECURS=1 CCCDLFLAGS=


# --- MakeMaker test section:

TEST_VERBOSE=0
TEST_TYPE=test_$(LINKTYPE)
TEST_FILE = test.pl
TEST_FILES = t/*.t
TESTDB_SW = -d

testdb :: testdb_$(LINKTYPE)

test :: $(TEST_TYPE)

test_dynamic :: pure_all
	PERL_DL_NONLAZY=1 $(FULLPERLRUN) "-I$(INST_LIB)" "-I$(INST_ARCHLIB)" $(TEST_FILE)

testdb_dynamic :: pure_all
	PERL_DL_NONLAZY=1 $(FULLPERLRUN) $(TESTDB_SW) "-I$(INST_LIB)" "-I$(INST_ARCHLIB)" $(TEST_FILE)

test_ : test_dynamic

test_static :: test_dynamic
testdb_static :: testdb_dynamic


# --- MakeMaker ppd section:
# Creates a PPD (Perl Package Description) for a binary distribution.
ppd:
	$(NOECHO) $(ECHO) '<SOFTPKG NAME="$(DISTNAME)" VERSION="0,1,0,0">' > $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <TITLE>$(DISTNAME)</TITLE>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <ABSTRACT></ABSTRACT>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <AUTHOR></AUTHOR>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <IMPLEMENTATION>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Class-AutoClass" VERSION="0,09,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Class-Singleton" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Class-WeakSingleton" VERSION="1,03,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="DBD-mysql" VERSION="2,9002,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Data-Dumper" VERSION="2,12,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Error" VERSION="0,15,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="IO-Scalar" VERSION="2,104,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Set-Scalar" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Storable" VERSION="2,06,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Test-Deep" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Test-More" VERSION="0,45,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="Text-Abbrev" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <DEPENDENCY NAME="YAML" VERSION="0,0,0,0" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <OS NAME="$(OSNAME)" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <ARCHITECTURE NAME="i686-linux-thread-multi" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <CODEBASE HREF="" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    </IMPLEMENTATION>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '</SOFTPKG>' >> $(DISTNAME).ppd


# --- MakeMaker pm_to_blib section:

pm_to_blib: $(TO_INST_PM)
	$(NOECHO) $(PERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', '\''$(PM_FILTER)'\'')'\
	  lib/Class/AutoDB/Connect.pm blib/lib/Class/AutoDB/Connect.pm \
	  lib/Class/AutoDB/RegistryDiff.pod blib/lib/Class/AutoDB/RegistryDiff.pod \
	  lib/Class/AutoDB/Registration.pm blib/lib/Class/AutoDB/Registration.pm \
	  lib/Class/AutoDB/Table.pm blib/lib/Class/AutoDB/Table.pm \
	  lib/Class/AutoDB/Oid.pm blib/lib/Class/AutoDB/Oid.pm \
	  lib/Class/AutoDB/CollectionDiff.pm blib/lib/Class/AutoDB/CollectionDiff.pm \
	  lib/Class/AutoDB/Collection.pm blib/lib/Class/AutoDB/Collection.pm \
	  lib/Class/AutoDB/Object.pm blib/lib/Class/AutoDB/Object.pm \
	  lib/Class/AutoDB/BaseTable.pm blib/lib/Class/AutoDB/BaseTable.pm \
	  lib/Class/AutoDB.pm blib/lib/Class/AutoDB.pm \
	  lib/Class/AutoDB/RegistryDiff.pm blib/lib/Class/AutoDB/RegistryDiff.pm \
	  lib/Class/AutoDB/Serialize.pm blib/lib/Class/AutoDB/Serialize.pm \
	  lib/Class/AutoDB/AutoDB.sql blib/lib/Class/AutoDB/AutoDB.sql \
	  lib/Class/AutoDB/Globals.pm blib/lib/Class/AutoDB/Globals.pm \
	  lib/Class/AutoDB/Object.sql blib/lib/Class/AutoDB/Object.sql \
	  lib/Class/AutoDB/Database.pm blib/lib/Class/AutoDB/Database.pm \
	  lib/Class/AutoDB/RegistryVersion.pm blib/lib/Class/AutoDB/RegistryVersion.pm \
	  lib/Class/AutoDB/Cursor.pm blib/lib/Class/AutoDB/Cursor.pm \
	  lib/Class/AutoDB/ListTable.pm blib/lib/Class/AutoDB/ListTable.pm \
	  lib/Class/AutoDB/Registry.pm blib/lib/Class/AutoDB/Registry.pm 
	$(NOECHO) $(TOUCH) $@

# --- MakeMaker selfdocument section:


# --- MakeMaker postamble section:


# End.