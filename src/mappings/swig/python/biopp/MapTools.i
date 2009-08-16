%module bpp_maptools
%{
#include "MapTools.h"
using namespace bpp;
%}

%include "std_map.i"
%include "std_vector.i"

using namespace std;

%ignore MapTools::MapTools;
%ignore MapTools::~MapTools;

%warnfilter(509) MapTools;

class MapTools
{
  public:
    template <class Key, class T, class Cmp > static vector<Key> getKeys(const map<Key, T, Cmp> & myMap);
    template <class Key, class T > static vector<Key> getKeys(const map<Key, T> & myMap);
    template <class Key, class T, class Cmp > static vector<T> getValues(const map<Key, T, Cmp> & myMap);
    template <class Key, class T > static vector<T> getValues(const map<Key, T> & myMap);

    /*%template(getIntKeys) getKeys<int,int>;
    %template(getIntDblKeys) getKeys<int,double>;
    %template(getIntStrKeys) getKeys<int,std::string>;
    %template(getDblIntKeys) getKeys<double,int>;
    %template(getDoubleKeys) getKeys<double,double>;
    %template(getDblStrKeys) getKeys<double,std::string>;
    %template(getStrIntKeys) getKeys<std::string,int>;
    %template(getStrDblKeys) getKeys<std::string,double>;
    %template(getStringKeys) getKeys<std::string,std::string>;

    %template(getIntValues) getValues<int,int>;
    %template(getIntDblValues) getValues<int,double>;
    %template(getIntStrValues) getValues<int,std::string>;
    %template(getDblIntValues) getValues<double,int>;
    %template(getDoubleValues) getValues<double,double>;
    %template(getDblStrValues) getValues<double,std::string>;
    %template(getStrIntValues) getValues<std::string,int>;
    %template(getStrDblValues) getValues<std::string,double>;
    %template(getStringValues) getValues<std::string,std::string>;*/

    %template(getKeys) getKeys<int,int>;
    %template(getKeys) getKeys<int,double>;
    %template(getKeys) getKeys<int,std::string>;
    %template(getKeys) getKeys<double,int>;
    %template(getKeys) getKeys<double,double>;
    %template(getKeys) getKeys<double,std::string>;
    %template(getKeys) getKeys<std::string,int>;
    %template(getKeys) getKeys<std::string,double>;
    %template(getKeys) getKeys<std::string,std::string>;

    %template(getValues) getValues<int,int>;
    %template(getValues) getValues<int,double>;
    %template(getValues) getValues<int,std::string>;
    %template(getValues) getValues<double,int>;
    %template(getValues) getValues<double,double>;
    %template(getValues) getValues<double,std::string>;
    %template(getValues) getValues<std::string,int>;
    %template(getValues) getValues<std::string,double>;
    %template(getValues) getValues<std::string,std::string>;
};
