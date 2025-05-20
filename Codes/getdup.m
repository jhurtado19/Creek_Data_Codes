% find duplicate indices
function getdup(A)
[v, w] = unique( A, 'stable' );
duplicate_indices = setdiff( 1:numel(A), w )
end
