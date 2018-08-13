function refined = DeleteMin_Max(unRefined)
  [minValue, rowsToDelete1] = min(unRefined);
  [maxValue, rowsToDelete2] = max(unRefined);
  refined = unRefined([rowsToDelete1, rowsToDelete2], :) = [];  % Get rid of min(s) and max(es).
end