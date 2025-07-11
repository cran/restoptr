% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_no_new_patch_constraint.R
\name{add_no_new_patch_constraint}
\alias{add_no_new_patch_constraint}
\title{Add constraint to forbid the creation of new patches.}
\usage{
add_no_new_patch_constraint(problem)
}
\arguments{
\item{problem}{\code{\link[=restopt_problem]{restopt_problem()}} Restoration problem object.}
}
\value{
An updated restoration problem (\code{\link[=restopt_problem]{restopt_problem()}}) object.
}
\description{
Add constraint to a restoration problem (\code{\link[=restopt_problem]{restopt_problem()}}) object
to forbid the creation to new patches. All restored areas must be connected
to an existing habitat area.
}
\details{
A patch is a spatially continuous set of habitat and restoration
planning units. This constraints applies on the union of the set of planning
units that are selected for restoration and the initial habitat patches,
and forbids the creation of new patches. All areas selected for restoration
must be connected to initially existing habitat areas. This constraint is
particularly useful for fragmentation reduction scenarios, where most of
the time it is desirable to extend and merge existing patches, instead of
creating new ones. In such cases, it also reduces the combinatorial
complexity by filtering areas that cannot be connected to existing patches.
}
\examples{
\dontrun{
# load data
habitat_data <- rast(
  system.file("extdata", "habitat_hi_res.tif", package = "restoptr")
)

# create problem
p <- restopt_problem(
    existing_habitat = habitat_data,
    aggregation_factor = 16,
    habitat_threshold = 0.7
  ) \%>\%
  add_restorable_constraint(
    min_restore = 10,
    max_restore = 100,
  ) \%>\%
  add_no_new_patch_constraint()

# plot preprocessed data
plot(rast(list(p$data$existing_habitat, p$data$restorable_habitat)), nc = 2)

# print problem
print(p)

# Solve problem
s <- solve(p)
# plot solution
plot(s)
}

}
\seealso{
Other constraints: 
\code{\link{add_available_areas_constraint}()},
\code{\link{add_compactness_constraint}()},
\code{\link{add_components_constraint}()},
\code{\link{add_connected_constraint}()},
\code{\link{add_locked_out_constraint}()},
\code{\link{add_min_iic_constraint}()},
\code{\link{add_min_mesh_constraint}()},
\code{\link{add_nb_patches_constraint}()},
\code{\link{add_restorable_constraint}()}
}
\concept{constraints}
