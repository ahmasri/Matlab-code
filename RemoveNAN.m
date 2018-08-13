function NoNan = RemoveNAN(WithNan)

          indexess = ~isnan(WithNan);
          NoNan = WithNan(indexess)';
end