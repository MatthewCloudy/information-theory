filepath = "pti-01/skryba/monolog-skryby-oryginal.mp3";
%filepath = "pti-01/skryba/monolog-skryby-oryginal.mp3";
splits = [1000, 100, 50, 10, 5];
output = "pti-01/scripts/scalar/outputs";

v_mse = generate_sounds(filepath, splits, @scalar_q, output)