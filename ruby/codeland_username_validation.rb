def CodelandUsernameValidation(str)
  str.match?(/^[a-zA-Z][a-zA-Z0-9_]{2,24}(?<!_)$/)
end
