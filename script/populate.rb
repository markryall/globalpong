flying_objects = [
  [1252806927, -37.816307, 144.96402, 59.90807, 10.752912, 23.97, 'mark.ryall@gmail.com', 'the one true ball']
]

flying_objects.each |a| do
  t = Time.at a.shift
  FlyingObject.create! :start_lat = a.shift,
    :start_lon => a.shift,
    :aim_lat => a.shift,
    :aim_lon => a.shift,
    :speed => a.shift,
    :created_by => a.shift,
    :created_at => a.shift,
    :created_at => t,
    :updated_at => t
end
