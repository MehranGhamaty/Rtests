
#include <Rcpp.h>
#include <string>
#include <fstream>

using namespace Rcpp;

class Logger{
public:
  /** Default Constructor */
  Logger(){}
  
  /** Constructor */
  Logger(std::string filepath_)
  {
    std::cout<<"test"<< std::endl;
    setFilePath(filepath_);
  }
  
  /** Destructor */ 
  /* explicitly specified destructors should be annotated noexcept as best-practice */
  ~Logger()  
  {
    logfile.close();
  }
  
  /** writes to the file */
  void log(std::string tolog)
  {
    logfile << tolog << std::endl;
  }
  
  /** sets the log file path */
  void setFilePath(std::string path)
  {
    filepath = path;
    logfile.open(filepath.c_str());
  }
  
  /** gets the file path */
  std::string getFilePath()
  {
    return filepath;
  }
  
  
private:
  
  std::string filepath;
  std::ofstream logfile;
};

RCPP_MODULE(logger_module) {
  
  using namespace Rcpp;
  class_<Logger>( "Logger" )
  .constructor<std::string>()
  .method( "setFilePath", &Logger::setFilePath )
  .method( "getFilePath", &Logger::getFilePath )
  .method( "log", &Logger::log )
  ;
}
