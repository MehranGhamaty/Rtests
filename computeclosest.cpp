#include <Rcpp.h>

using namespace Rcpp;

void cfunction(double* x, int n, double* y) {
  for(int i = 0; i < n; i++) y[i] = x[i] + 1;
}

float square(float to_square)
{
  return to_square * to_square;
}
  
float eucdist(NumericVector source, NumericVector target)
{
  float total = 0.0;
  for(int i = 0; i< source.size();i++)
  {
    total += square(source[i] - target[i]);
  }
  return total; 
}

//http://stackoverflow.com/questions/26194225/rcpp-returning-c-array-as-numericmatrix-to-r

// [[Rcpp::export]]
void computeclosestcpp(NumericMatrix x, NumericMatrix centers, NumericVector y)
{
  //vector holding the answers (holds the closest centroid to each point)
  int closest[x.rows()];
  
  //loop through each row in the data
  for(int r_x = 0; r_x < x.rows(); r_x++)
  {
    //hold the distance from the row to each center
    int distances[centers.rows()];
    
    //loop through each center in centers
    for(int r_centers = 0; r_centers < centers.rows(); r_centers++)
    {
      
      //go through each column in the x row
      for(int c_x = 0; c_x < x.cols(); c_x++)
      { 
        std::cout << "("<< c_x*x.cols()+r_x << " : " << c_x << "," << r_x << ")" << x[(c_x*x.rows())+r_x] << "\t";
        for(int c_centers = 0; c_centers < centers.cols(); c_centers++)
        {
          //std::cout << "x at row " << r_x << " column " << c_x << " : "<< x[(c_x*x.cols())+r_x] << std::endl;
          //std::cout << "center at row " << r_centers << " column " << c_centers << " : "<< centers[(c_centers*centers.cols())+r_centers] << std::endl;
          
        }
      }
      std::cout << std::endl;
    }
  }
}


/*** R

x = matrix(c(1,3,5,2,4,6),nrow=3,ncol=2)
centers = matrix(c(1,5,3,4),nrow=2,ncol=2)
y = matrix(0,nrow=2,ncol=2)
x
computeclosestcpp(x, centers, y, log)
*/
