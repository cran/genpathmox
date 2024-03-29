#' @title  Pathmox Segmentation Trees in Partial Least Squares Structural Equation 
#' Modeling (PLS-SEM)
#' 
#' @description
#' \code{pls.pathmox} calculates a binary segmentation tree in the context 
#' of partial least squares structural equation modeling (PLS-SEM) following the 
#' PATHMOX algorithm. It detects heterogeneity  
#' in PLS-SEM models when the segmentation variables (categorical 
#' variables), external to the model, are available, and when the objective 
#' of the research is exploratory. \code{pls.pathmox} function returns the 
#' most significant different models associated with the terminal nodes of the 
#' tree. It also returns a ranking according to importance of the categorical 
#' variables used in the split process. \code{pls.pathmox} also enables 
#' the hybrid multigroup analysis (Lamberti, 2021) to be run. In fact, the function 
#' returns an object, \code{.hybrid}, containing the datasets associated 
#' with the terminal nodes prepared to be treated with the \code{cSEM} package 
#' (Rademaker and Schuberth, 2020). It thus enables the MICOM and MGA procedures to be run 
#' (Hair et al., 2017; Henseler et al., 2016; Henseler et al., 2009). 
#' 
#' @details
#' \code{pls.pathmox} uses the classical lavaan syntax to define inner and outer 
#' models and mode. The user can choose to perform the analysis for a
#' single categorical variable or a set of factors. In the latter case, categorical 
#' variables must be organized as a dataframe. Scheme is equal to \code{path} by 
#' default following other PLS-SEM softwares (SMART-PLS (Ringle at al., 2015), 
#' cSEM R package (Rademaker and Schuberth, 2020)), but can be modified by the user to
#' \code{"centroid"} or \code{"factorial"}. Stops parameters (\code{.alpha} (threshold 
#' significance for the partitioning algorithm), \code{.deep} (maximum tree depth),
#' and \code{.size} (minimum admissible sample size for a node)) are fixed respectively to 
#' \code{.alpha} = 0.05, \code{.deep} = 2, and \code{.size} = 0.10 according to Lamberti et al. (2016). 
#' However, again the user can modify these parameters according to the specific 
#' objectives of the analysis. \code{pls.pathmox} also defines a minimum 
#' admissible size for a candidate node that restricts the search of the optimal split 
#' to that partitions that produce nodes with an adequate number of observations. 
#' This parameter (\code{.size_candidate}) is fixed to 50 observations by default. 
#' PLS-SEM model coefficients used in the split process are estimated by applying the 
#' consistent PLS-SEM algorithm proposed by Dijkstra and Henseler (2015). However, the user can choose 
#' to run the analysis by using the classical algorithm by setting to FASLE the paramenter  
#' \code{.consistent}. \code{pls.pathmox} also returns an object containing the datasets associated with 
#' the terminal nodes (\code{object$hybrid}) prepared to be treated with the \code{cSEM} package 
#' (Rademaker and Schuberth, 2020). This means that, once the pathmox finalizes the search for 
#' the most significant different groups associated with the most significant different PLS-SEM models, 
#' the user can perform a detailed analysis for each group using the \code{cSEM} package, or can 
#' run the MICOM and MGA procedures (Hair et al. 2017; Henseler et al. 2016) on the terminal nodes.
#' 
#' @param .model A description of the user-specified model. The model is described using 
#' the \href{https://lavaan.ugent.be/tutorial/syntax1.html}{lavaan syntax}. 
#' Structural and measurement models are defined by enclosure between double quotes. 
#' The directional link between constructs is defined using the ("~") operator. 
#' On the left-hand side of the operator is the dependent construct and on the 
#' right-hand side are the explanatory constructs, separated by the ("+") operator. As for 
#' the outer model, constructs are defined by listing their corresponding MVs after 
#' the operator ("=~") if latent variable is modelled as a common factor, 
#' or the operator("<~") if latent variable is modelled as a composite. On the left-hand side 
#' of the operator, is the construct and on the right-hand side are the MVs separated by the ("+") operator. 
#' Variable labels cannot contain ("."). 
#' @param .data A matrix or dataframe containing the manifest variables.
#' @param .catvar A single factor or set of factors organized as a dataframe containing
#' the categorical variables used as sources of heterogeneity.
#' @param .scheme A string indicating the type of inner weighting scheme. Possible 
#' values are \code{"centroid"}, \code{"factorial"}, or \code{"path"}. By default
#' \code{.scheme} is equal to \code{"path"}.
#' @param .consistent Logical. Should composite/proxy correlations be disattenuated 
#' to yield consistent loadings and path estimates if at least one of the construct 
#' is modeled as a common factor. Defaults to TRUE.
#' @param .alpha A decimal value indicating the minimum threshold significance 
#' for the partitioning algorithm. By default \code{.alpha} is equal to 0.05.
#' @param .deep An integer indicating the maximum tree depth. Must be an integer equal to or 
#' greater than 1. By default \code{.deep} is equal to 2.
#' @param .size  A decimal value indicating the minimum admissible sample size for a node. It is 
#' equal to 0.10 by default meaning that the minimum sample size of the  node is equal to the 10$%$ 
#' of the total number of observations.
#' @param .size_candidate An integer indicating the minimum admissible sample size for a candidate 
#' node. It is equal to \code{50} observations by default.
#' @param .tree A string indicating if the tree plot must be shown. By default, it is equal to 
#' \code{TRUE}.
#' 
#'
#' @return An object of class \code{"plstree"}. This is a list with the
#' following results:
#' @return \item{MOX}{dataframe containing the results of the segmentation tree.}
#' @return \item{terminal_paths}{dataframe containing PLS-SEM model terminal nodes 
#' (path coeff. & R^2).}
#' @return \item{var_imp}{dataframe containing the categorical variable ranking by importance.}
#' @return \item{Fg.r}{dataframe containing the results of the F-global test for each 
#' node partition.}
#' @return \item{Fc.r}{list of dataframes containing the results of the F-coefficient test 
#' for each node.}
#' @return \item{hybrid}{list of datasets associated with the terminal node prepared for MGA with 
#' cSEM R package.} 
#' @return \item{other}{Other parameters and results.} 
#' 
#' @author Giuseppe Lamberti
#' 
#' @references Klesel, M., Schuberth, F., Niehaves, B., and Henseler, J. (2022). Multigroup analysis 
#' in information systems research using PLS-PM: A systematic investigation of approaches. 
#' \emph{ACM SIGMIS Database: the DATABASE for Advances in Information Systems}, \bold{53}(3), 26-48.
#' \doi{10.1145/3551783.3551787}
#' 
#' @references Hair, J. F., Risher, J. J., Sarstedt, M., and Ringle, C. M. (2019). When to use and 
#' how to report the results of PLS-SEM. \emph{European business review}, \bold{31}(1), 2-24.
#' \doi{10.1108/EBR-11-2018-0203}
#' 
#' @references Hair, J. F., Sarstedt, M., Ringle, C. M., and Gudergan, S. P. (2017). 
#' \emph{Advanced issues in partial least squares structural equation modeling}. SAGE publications:
#' Los Angeles
#' 
#' @references Henseler, J., Ringle, C. M., and Sarstedt, M. (2016). Testing measurement invariance of 
#' composites using partial least squares. \emph{International marketing review}, \bold{33}(3), 405-431.
#' \doi{10.1108/IMR-09-2014-0304}
#'
#' @references Ringle, C. M., and Sinkovics, R. R. (2009). The use of partial least squares path modeling 
#' in international marketing. \emph{Advances in International Marketing}, \bold{20}, 277-319.
#' \doi{10.1108/S1474-7979(2009)0000020014}
#' 
#' @references Dijkstra, T. K., and Henseler, J. (2015). Consistent partial least squares path modeling. 
#' \emph{MIS quarterly}, \bold{39}(2), 297-316. \doi{10.25300/MISQ/2015/39.2.02}
#' 
#' @references Lamberti, G. (2021). Hybrid multigroup partial least squares structural equation
#' modelling: an application to bank employee satisfaction and loyalty. \emph{Quality and Quantity},
#' \doi{10.1007/s11135-021-01096-9}
#'
#' @references Lamberti, G., Aluja, T. B., and Sanchez, G. (2017). The Pathmox approach for PLS path 
#' modeling: Discovering which constructs differentiate segments. \emph{Applied Stochastic Models in 
#' Business and Industry}, \bold{33}(6), 674-689. \doi{10.1007/s11135-021-01096-9}
#' 
#' @references Lamberti, G., Aluja, T. B., and Sanchez, G. (2016). The Pathmox approach for PLS path 
#' modeling segmentation. \emph{Applied Stochastic Models in Business and Industry}, \bold{32}(4), 453-468.
#' \doi{10.1002/asmb.2168}
#'               
#' @references Lamberti, G. (2015). \emph{Modeling with Heterogeneity}, PhD Dissertation.
#' 
#' @references Rademaker, M. E., and Schuberth, F. (2020). cSEM: Composite-Based Structural Equation Modeling.
#' Available at \url{https://CRAN.R-project.org/package=cSEM}.
#' 
#' @references Ringle, C.M., Wende, S. and Becker, J.M. (2015). SmartPLS 3. Boenningstedt: SmartPLS. Retrieved 
#' from  \url{https://www.smartpls.com}.
#'
#' @references Sanchez, G. (2009). \emph{PATHMOX Approach: Segmentation Trees in
#' Partial Least Squares Path Modeling}, PhD Dissertation. 
#' 
#' @references Sanchez, G., and Aluja, T. B. (2006). PATHMOX: A PLS-PM Segmentation Algorithm, in
#' Proceedings of the IASC Symposium on Knowledge Extraction by Modelling,
#' International Association for Statistical Computing Island of Capri, Italy 4-6 September.
#' 
#' @import stats diagram methods graphics grDevices matrixcalc
#' @importFrom cSEM parseModel csem 
#' 
#' @seealso \code{\link{print.plstree}}, \code{\link{summary.plstree}},  
#' \code{\link{bar_terminal}}, \code{\link{bar_impvar}} and \code{\link{plot.plstree}}
#' 
#' @export
#' @examples
#'  \dontrun{
#' # Example of PATHMOX approach in customer satisfaction analysis 
#' # (Spanish financial company).
#' # Model with 5 LVs (4 common factor: Image (IMAG), Value (VAL), 
#' # Satisfaction (SAT), and Loyalty (LOY); and 1 composite construct: 
#' # Quality (QUAL)
#' 
#' # Load library and dataset csibank
#' library(genpathmx)
#' data("csibank")
#' 
#' # Define the model using the laavan syntax. Use a set of regression formulas that define 
#' # first the structural model and then the measurement model
#'
#' CSImodel <- "
#' # Structural model
#' VAL  ~ QUAL
#' SAT  ~ IMAG  + QUAL + VAL
#' LOY  ~ IMAG + SAT
#'
#' # Measurement model
#' # composite
#' QUAL <~ qual1 + qual2 + qual3 + qual4 + qual5 + qual6 + qual7 
#'      
#' # common factor
#' IMAG =~ imag1 + imag2 + imag3 + imag4 + imag5 + imag6 
#' VAL  =~ val1  + val2  + val3  + val4
#' SAT  =~ sat1  + sat2  + sat3           
#' LOY  =~ loy1  + loy2  + loy3          
#'
#' "
#' 
#' # Identify the categorical variable to be used as input variables 
#' # in the split process
#' CSIcatvar = csibank[,1:5]
#'
#' # Check if variables are well specified (they have to be factors 
#' # and/or ordered factors)
#' str(CSIcatvar)
#'
#' # Transform Age and Education into ordered factors
#' CSIcatvar$Age = factor(CSIcatvar$Age, levels = c("<=25", 
#'                                      "26-35", "36-45", "46-55", 
#'                                      "56-65", ">=66"),ordered = T)
#'
#' CSIcatvar$Education = factor(CSIcatvar$Education, 
#'                             levels = c("Unfinished","Elementary", "Highschool",
#'                             "Undergrad", "Graduated"),ordered = T)
#'        
#' # Run Pathmox analysis (Lamberti et al., 2016; 2017)
#' csi.pathmox = pls.pathmox(
#'  .model = CSImodel ,
#'  .data  = csibank,
#'  .catvar= CSIcatvar,
#'  .alpha = 0.05,
#'  .deep = 2
#' )                     
#'                       
#' # Visualize results by summary
#' # summary(csi.pathmox)
#'
#' # Run pathmox on one single variable
#' age = csibank[,2]
#' 
#' #' # Transform Age into an ordered factor
#' age = factor(age, levels = c("<=25", 
#'                                      "26-35", "36-45", "46-55", 
#'                                      "56-65", ">=66"),ordered = T)
#' csi.pathmox.age = pls.pathmox(
#'  .model = CSImodel ,
#'  .data  = csibank,
#'  .catvar= age,
#'  .alpha = 0.05,
#'  .deep = 1
#' )  
#'
#' # Run hybrid multigroup analysis (Lamberti, 2021) using 
#' # the cSEM package (Rademaker and Schuberth, 2020)
#' # Install and load cSEM library
#' # Install.packages("cSEM")
#' # library(cSEM)
#' 
#' # Run cSEM Model for Pathmox terminal nodes
#'
#' csilocalmodel = csem(
#'  .model = CSImodel,
#'  .data = csi.pathmox.age$hybrid)
#' 
#' # Check invariance and run MGA analysis (Hair et al., 2019)
#' 
#' testMICOM(csilocalmodel, .R = 60)
#' 
#' to_compare <- "
#' #' # Structural model
#' VAL  ~ QUAL
#' SAT  ~ IMAG  + QUAL + VAL
#' LOY  ~ IMAG + SAT
#' "
#' 
#' testMGD(csilocalmodel, .parameters_to_compare = to_compare, 
#' .R_bootstrap = 60,.approach_mgd = "Henseler")
#' 
#' }
#'
pls.pathmox = function(.model,
                       .data, 
                       .catvar,
                       .scheme = "path",
                       .consistent = TRUE,
                       .alpha = 0.05,
                       .deep = 2,
                       .size = 0.10,
                       .size_candidate = 50,
                       .tree = TRUE
)
  
{
  
  check = check_arg_mox(.model = .model, .data = .data, .catvar=.catvar, .scheme = .scheme, 
                        .consistent =.consistent, .alpha = .alpha, .deep =.deep , .size =.size,
                        .size_candidate = .size_candidate , .tree =.tree)

  .model = check$model
  .data = check$data
  .catvar = check$catvar
  .scheme = check$scheme
  .consistent = check$consistent
  .alpha = check$alpha
  .deep = check$deep
  .size = check$size
  .size_candidate = check$size_candidate
  .tree = check$tree
  
  .mod=cSEM::parseModel(.model)
  
  .inner = as.matrix(.mod$structural)
  
  info.mox(.alpha,.size,.deep,.catvar)
  
  .par_mode  = list(alpha = .alpha,size = .size,deep = .deep,data = .data,catvar = .catvar,
                  inner = .inner,scheme = .scheme,consistent = .consistent)
  
  .min.ind.node = percent.node(.data,.size)
  
  .hybrid = list()
  
  .id = 0
  .t = methods::new ("moxtree",id=.id)
  .dim_row = dim(.data)[1]
  .elements = seq(1:.dim_row)
  .id = .id+1
  .root = new("node",id = .id,elements = .elements,father = 0,childs = 0)
  .new_nodes = list(.root)
  while(length(.new_nodes) > 0){
    .n = .new_nodes[[1]]
    
    if(length(.n@elements)>=.min.ind.node$min.n.ind && showDeepth(.n) < .deep){
      
      .d = .data[.n@elements,]
      .s = .catvar[.n@elements,]
      .cat		=	sapply(.s, is.factor)
      .s[.cat] 	=	lapply(.s[.cat],factor)
      
      .tmp = partopt(.d,.s,.inner,.model,.scheme,.consistent,.size_candidate)
      
      if(.tmp$pvl.opt <= .alpha && any(!is.null(.tmp$pvl.opt)) == TRUE) {
        
        .variable		  = .tmp$variable.opt
        .level		    = .tmp$level.opt
        .candidates	  = .tmp$candidates
        .modtwo		    = .tmp$modtwo.opt
        
        .mod=test.partition(.d,.inner,.model,.scheme,.consistent,.modtwo,.alpha)
        
        if(any(.mod$pvc <= .alpha) == TRUE){
          
          .fglobal = .mod$Fg
          .fcoef   = .mod$Fc
          .pvg     = .mod$pvg
          .pvc     = .mod$pvc
          
          for(i in 1:2){
            .elements = .n@elements[which(.modtwo==i)]
            .child_id = (.n@id*2)+i-1
            .child = new("node",id = .child_id,elements = .elements,father = .n@id)
            .n@childs[i] = .child_id
            .new_nodes[[length(.new_nodes)+1]] = .child
          }
          .n@info=new("info",
                     variable=.variable,
                     level=.level,
                     fgstatistic=.fglobal,
                     fpvalg=.pvg,
                     fcstatistic=.fcoef,
                     fpvalc=.pvc, 
                     candidates=.candidates)
          
        }}}
    .t@nodes[[length(.t@nodes)+1]] = .n
    .new_nodes[1] = NULL
  }
  if	(length(.t@nodes)==1 )  
  {
    .root = root.tree(.t)
    cat("No sognificative partition faunded")
    .res = list(root = .root,par_mode = .par_mode)
  }
  else
  {
    .MOX = mox.tree(.t)
    .root = root.tree(.t)
    .terminal = terminal.tree(.t)
    .nodes = nodes.tree(.t)
    .candidates = candidates.tree(.t)
    .Fg.r = fglobal.tree(.t)
    .Fc.r = fcoef.tree(.t)
    
    for( i in 2: length(.terminal))  {
      
      .data.node=cbind(.data[.terminal[[i]],],
                      hybird_var = rep(paste(names(.terminal)[i]),
                                     length(.terminal[[i]])))
      
      .hybrid[[length(.hybrid)+1]] = .data.node
      
    }
    names(.hybrid) = names(.terminal)[2:length(.terminal)]
    
    
    .terminal_paths = NULL
    for(i in 2:length(.terminal))
    {
      .dt_terminal=.data[.terminal[[i]],]
      .pls_path = as.matrix(.path(cSEM::csem(.dt_terminal, .model,.PLS_weight_scheme_inner = .scheme,
                                       .disattenuate = .consistent)$Estimates$Path_estimates))
      rownames(.pls_path)=element(.inner)
      .pls_R2 = as.matrix(cSEM::csem(.dt_terminal, .model,.PLS_weight_scheme_inner = .scheme,
                                     .disattenuate = .consistent)$Estimates$R2)
      rownames(.pls_R2) = paste("R^2",rownames(.pls_R2))
      .pls_model = rbind(.pls_path,.pls_R2)
      .terminal_paths = cbind(.terminal_paths,.pls_model)
    }
    colnames(.terminal_paths) = names(.terminal)[2:length(.terminal)]
    
    .var_imp=var_imp_mox(.candidates,.catvar)
    
    .other = list(candidates = .candidates,
                 root =.root,
                 nodes = .nodes,
                 terminal = .terminal,
                 par_mode = .par_mode)
    
    .res = list(MOX = .MOX,
               terminal_paths = round(.terminal_paths,4),
               var_imp = .var_imp,
               Fg.r = .Fg.r,
               Fc.r = .Fc.r,
               hybrid = .hybrid,
               other = .other)
    class(.res) = "plstree"
    if (.tree) 
     plot(.res)
  }
  .res
  }

