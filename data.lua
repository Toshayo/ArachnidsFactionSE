require ("util")

require("prototypes.entity.autoplace-controls")
local arachnid_autoplace = require("prototypes.entity.arachnid-autoplace-utils")
require("prototypes.entity.arachnid_sounds")

small_arachnid_scale = 0.9
small_arachnid_tint1 = {r=1, g=0.6, b=0, a=0}
small_arachnid_tint2 = {r=1 , g=0.9, b=0, a=0}


medium_arachnid_scale = 1.1
medium_arachnid_tint1 = {r=1, g=0.45, b=0, a=0}
medium_arachnid_tint2 = {r=1, g=0.7, b=0, a=0}


big_arachnid_scale = 1.3
big_arachnid_tint1 = {r=1, g=0.3, b=0, a=0}
big_arachnid_tint2 = {r=1, g=0.5, b=0, a=0}



behemoth_arachnid_scale = 1.5
behemoth_arachnid_tint1 = {r=1, g=0.1, b=0, a=0}
behemoth_arachnid_tint2 = {r=1, g=0.3, b=0, a=0}



arachnid_spawner_scale_0 = 1.5
arachnid_spawner_scale_1 = 1.7
arachnid_spawner_scale_2 = 2
arachnid_spawner_scale_3 = 2.2


local function arachnidsrunanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      {
        filenames =
        {
          "__ArachnidsFactionSE__/graphics/Arachnids-run-01.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-run-02.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-run-03.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-run-04.png"
        },
        slice = 8,
        lines_per_file = 8,
        line_length = 8,
        width = 199,
        height = 175,
        frame_count = 16,
        direction_count = 16,
        --shift = util.mul_shift(util.by_pixel(-2, -6), scale),
        scale = scale,
        hr_version =
        {
          filenames =
          {
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-run-01.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-run-02.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-run-03.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-run-04.png"
          },
          slice = 8,
          lines_per_file = 8,
          line_length = 8,
          width = 398,
          height = 350,
          frame_count = 16,
          --shift = util.mul_shift(util.by_pixel(-1, -5), scale),
          direction_count = 16,
          scale = 0.5 * scale
        }
      },
      {
        filenames =
        {
          "__ArachnidsFactionSE__/graphics/Arachnids-run-mask1-01.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-run-mask1-02.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-run-mask1-03.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-run-mask1-04.png"
        },
        slice = 8,
        lines_per_file = 8,
        flags = { "mask" },
        line_length = 8,
        width = 199,
        height = 175,
        frame_count = 16,
        direction_count = 16,
        --shift = util.mul_shift(util.by_pixel(-2, -6), scale),
        scale = scale,
        tint = tint1,
        hr_version =
        {
          filenames =
          {
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-run-mask1-01.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-run-mask1-02.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-run-mask1-03.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-run-mask1-04.png"
          },
          slice = 8,
          lines_per_file = 8,
          line_length = 8,
          width = 398,
          height = 350,
          frame_count = 16,
          --shift = util.mul_shift(util.by_pixel(-1, -37), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          tint = tint1
        }
      },
      {
        filenames =
        {
          "__ArachnidsFactionSE__/graphics/Arachnids-run-mask2-01.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-run-mask2-02.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-run-mask2-03.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-run-mask2-04.png"
        },
        slice = 8,
        lines_per_file = 8,
        flags = { "mask" },
        line_length = 8,
        width = 199,
        height = 175,
        frame_count = 16,
        direction_count = 16,
        --shift = util.mul_shift(util.by_pixel(-2, -6), scale),
        scale = scale,
        tint = tint2,
        hr_version =
        {
          filenames =
          {
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-run-mask2-01.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-run-mask2-02.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-run-mask2-03.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-run-mask2-04.png"
          },
          slice = 8,
          lines_per_file = 8,
          line_length = 8,
          width = 398,
          height = 350,
          frame_count = 16,
          --shift = util.mul_shift(util.by_pixel(-1, -5), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          tint = tint2
        }
      },
      {
        filenames =
        {
          "__ArachnidsFactionSE__/graphics/Arachnids-run-shadow-01.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-run-shadow-02.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-run-shadow-03.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-run-shadow-04.png"
        },
        slice = 8,
        lines_per_file = 8,
        line_length = 8,
        width = 199,
        height = 120,
        frame_count = 16,
        shift = util.mul_shift(util.by_pixel(18, 18), scale),
        direction_count = 16,
        scale =  1.24 * scale,
        draw_as_shadow = true,
        hr_version =
        {
          filenames =
          {
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-run-shadow-01.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-run-shadow-02.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-run-shadow-03.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-run-shadow-04.png"
          },
          slice = 8,
          lines_per_file = 8,
          line_length = 8,
          width = 398,
          height = 240,
          frame_count = 16,
          shift = util.mul_shift(util.by_pixel(18, 18), scale),
          direction_count = 16,
          scale = 0.62 * scale,
          draw_as_shadow = true
        }
      }
    }
  }
end

local function arachnidsattackanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      {
        filenames =
        {
          "__ArachnidsFactionSE__/graphics/Arachnids-attack-01.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-attack-02.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-attack-03.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-attack-04.png"
        },
        slice = 11,
        lines_per_file = 4,
        line_length = 16,
        width = 199,
        height = 175,
        frame_count = 11,
        direction_count = 16,
        animation_speed = 0.4,
        --shift = util.mul_shift(util.by_pixel(-2, -26), scale),
        scale = scale,
        hr_version =
        {
          filenames =
          {
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-attack-01.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-attack-02.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-attack-03.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-attack-04.png"
          },
          slice = 11,
          lines_per_file = 4,
          line_length = 16,
          width = 398,
          height = 350,
          frame_count = 11,
          --shift = util.mul_shift(util.by_pixel(0, -25), scale),
          direction_count = 16,
          animation_speed = 0.4,
          scale = 0.5 * scale
        }
      },
      {
        filenames =
        {
          "__ArachnidsFactionSE__/graphics/Arachnids-attack-mask1-01.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-attack-mask1-02.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-attack-mask1-03.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-attack-mask1-04.png"
        },
        slice = 11,
        lines_per_file = 4,
        flags = { "mask" },
        line_length = 16,
        width = 199,
        height = 175,
        frame_count = 11,
        direction_count = 16,
        animation_speed = 0.4,
        --shift = util.mul_shift(util.by_pixel(0, -42), scale),
        scale = scale,
        tint = tint1,
        hr_version =
        {
          filenames =
          {
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-attack-mask1-01.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-attack-mask1-02.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-attack-mask1-03.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-attack-mask1-04.png"
          },
          slice = 11,
          lines_per_file = 4,
          line_length = 16,
          width = 398,
          height = 350,
          frame_count = 11,
          --shift = util.mul_shift(util.by_pixel(-1, -41), scale),
          direction_count = 16,
          animation_speed = 0.4,
          scale = 0.5 * scale,
          tint = tint1
        }
      },
      {
        filenames =
        {
          "__ArachnidsFactionSE__/graphics/Arachnids-attack-mask2-01.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-attack-mask2-02.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-attack-mask2-03.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-attack-mask2-04.png"
        },
        slice = 11,
        lines_per_file = 4,
        flags = { "mask" },
        line_length = 16,
        width = 199,
        height = 175,
        frame_count = 11,
        direction_count = 16,
        animation_speed = 0.4,
        --shift = util.mul_shift(util.by_pixel(-2, -42), scale),
        scale = scale,
        tint = tint2,
        hr_version =
        {
          filenames =
          {
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-attack-mask2-01.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-attack-mask2-02.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-attack-mask2-03.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-attack-mask2-04.png"
          },
          slice = 11,
          lines_per_file = 4,
          line_length = 16,
          width = 398,
          height = 350,
          frame_count = 11,
          --shift = util.mul_shift(util.by_pixel(-1, -41), scale),
          direction_count = 16,
          animation_speed = 0.4,
          scale = 0.5 * scale,
          tint = tint2
        }
      },
      {
        filenames =
        {
          "__ArachnidsFactionSE__/graphics/Arachnids-attack-shadow-01.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-attack-shadow-02.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-attack-shadow-03.png",
          "__ArachnidsFactionSE__/graphics/Arachnids-attack-shadow-04.png"
        },
        slice = 11,
        lines_per_file = 4,
        line_length = 16,
        width = 199,
        height = 120,
        frame_count = 11,
        shift = util.mul_shift(util.by_pixel(18, 18), scale),
        direction_count = 16,
        animation_speed = 0.4,
        scale = 1.24 * scale,
        draw_as_shadow = true,
        hr_version =
        {
          filenames =
          {
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-attack-shadow-01.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-attack-shadow-02.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-attack-shadow-03.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-attack-shadow-04.png"
          },
          slice = 11,
          lines_per_file = 4,
          line_length = 16,
          width = 398,
          height = 240,
          frame_count = 11,
          shift = util.mul_shift(util.by_pixel(18, 18), scale),
          direction_count = 16,
          animation_speed = 0.4,
          scale = 0.62 * scale,
          draw_as_shadow = true
        }
      }
    }
  }
end

local function arachnidsdieanimation(scale, tint1, tint2)
  return
  {
    layers=
    {
      {
        filenames =
        {

		"__ArachnidsFactionSE__/graphics/Arachnids-die-01.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-02.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-03.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-04.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-05.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-06.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-07.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-08.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-09.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-10.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-11.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-12.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-13.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-14.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-15.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-16.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-17.png"
		
         
        },
        slice = 4,
        lines_per_file = 4,
        line_length = 4,
        width = 199,
        height = 175,
        frame_count = 17,
        direction_count = 16,
        --shift= util.mul_shift(util.by_pixel(-2, -4), scale),
        scale = scale,
        hr_version =
        {
          filenames =
          {
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-01.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-02.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-03.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-04.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-05.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-06.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-07.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-08.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-09.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-10.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-11.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-12.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-13.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-14.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-15.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-16.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-17.png"
          },
          slice = 4,
          lines_per_file = 4,
          line_length = 4,
          width = 398,
          height = 350,
          frame_count = 17,
          --shift = util.mul_shift(util.by_pixel(0, -4), scale),
          direction_count = 16,
          scale = 0.5 * scale
        }
      },



--[[



      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-die-mask1-01.png",
          "__base__/graphics/entity/biter/biter-die-mask1-02.png",
          "__base__/graphics/entity/biter/biter-die-mask1-03.png",
          "__base__/graphics/entity/biter/biter-die-mask1-04.png",
          "__base__/graphics/entity/biter/biter-die-mask1-05.png",
          "__base__/graphics/entity/biter/biter-die-mask1-06.png",
          "__base__/graphics/entity/biter/biter-die-mask1-07.png",
          "__base__/graphics/entity/biter/biter-die-mask1-08.png",
          "__base__/graphics/entity/biter/biter-die-mask1-09.png",
          "__base__/graphics/entity/biter/biter-die-mask1-10.png",
          "__base__/graphics/entity/biter/biter-die-mask1-11.png",
          "__base__/graphics/entity/biter/biter-die-mask1-12.png",
          "__base__/graphics/entity/biter/biter-die-mask1-13.png",
          "__base__/graphics/entity/biter/biter-die-mask1-14.png",
          "__base__/graphics/entity/biter/biter-die-mask1-15.png",
          "__base__/graphics/entity/biter/biter-die-mask1-16.png",
          "__base__/graphics/entity/biter/biter-die-mask1-17.png"
        },
        slice = 4,
        lines_per_file = 4,
        flags = { "mask" },
        line_length = 4,
        width = 198,
        height = 166,
        frame_count = 17,
        direction_count = 16,
        --shift = util.mul_shift(util.by_pixel(0, -22), scale),
        scale = scale,
        tint = tint1,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-die-mask1-01.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-02.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-03.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-04.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-05.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-06.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-07.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-08.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-09.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-10.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-11.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-12.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-13.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-14.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-15.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-16.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask1-17.png"
          },
          slice = 4,
          lines_per_file = 4,
          line_length = 4,
          width = 398,
          height = 328,
          frame_count = 17,
          --shift = util.mul_shift(util.by_pixel(-1, -21), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          tint = tint1
        }
      },
      {
        filenames =
        {
          "__base__/graphics/entity/biter/biter-die-mask2-01.png",
          "__base__/graphics/entity/biter/biter-die-mask2-02.png",
          "__base__/graphics/entity/biter/biter-die-mask2-03.png",
          "__base__/graphics/entity/biter/biter-die-mask2-04.png",
          "__base__/graphics/entity/biter/biter-die-mask2-05.png",
          "__base__/graphics/entity/biter/biter-die-mask2-06.png",
          "__base__/graphics/entity/biter/biter-die-mask2-07.png",
          "__base__/graphics/entity/biter/biter-die-mask2-08.png",
          "__base__/graphics/entity/biter/biter-die-mask2-09.png",
          "__base__/graphics/entity/biter/biter-die-mask2-10.png",
          "__base__/graphics/entity/biter/biter-die-mask2-11.png",
          "__base__/graphics/entity/biter/biter-die-mask2-12.png",
          "__base__/graphics/entity/biter/biter-die-mask2-13.png",
          "__base__/graphics/entity/biter/biter-die-mask2-14.png",
          "__base__/graphics/entity/biter/biter-die-mask2-15.png",
          "__base__/graphics/entity/biter/biter-die-mask2-16.png",
          "__base__/graphics/entity/biter/biter-die-mask2-17.png"
        },
        slice = 4,
        lines_per_file = 4,
        flags = { "mask" },
        line_length = 4,
        width = 200,
        height = 166,
        frame_count = 17,
        direction_count = 16,
        --shift = util.mul_shift(util.by_pixel(-2, -22), scale),
        scale = scale,
        tint = tint2,
        hr_version =
        {
          filenames =
          {
            "__base__/graphics/entity/biter/hr-biter-die-mask2-01.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-02.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-03.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-04.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-05.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-06.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-07.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-08.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-09.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-10.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-11.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-12.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-13.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-14.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-15.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-16.png",
            "__base__/graphics/entity/biter/hr-biter-die-mask2-17.png"
          },
          slice = 4,
          lines_per_file = 4,
          line_length = 4,
          width = 396,
          height = 330,
          frame_count = 17,
          --shift = util.mul_shift(util.by_pixel(-1, -22), scale),
          direction_count = 16,
          scale = 0.5 * scale,
          tint = tint2
        }
      },



 --]]



      {
        filenames =
        {

          	"__ArachnidsFactionSE__/graphics/Arachnids-die-shadow-01.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-shadow-02.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-shadow-03.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-shadow-04.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-shadow-05.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-shadow-06.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-shadow-07.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-shadow-08.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-shadow-09.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-shadow-10.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-shadow-11.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-shadow-12.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-shadow-13.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-shadow-14.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-shadow-15.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-shadow-16.png",
		"__ArachnidsFactionSE__/graphics/Arachnids-die-shadow-17.png"
		
        },
        slice = 4,
        lines_per_file = 4,
        line_length = 4,
        width = 199,
        height = 120,
        frame_count = 17,
        shift = util.mul_shift(util.by_pixel(18, 18), scale),
        direction_count = 16,
        scale = 1.24 * scale,
        draw_as_shadow = true,
        hr_version =
        {
          filenames =
          {
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-shadow-01.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-shadow-02.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-shadow-03.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-shadow-04.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-shadow-05.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-shadow-06.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-shadow-07.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-shadow-08.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-shadow-09.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-shadow-10.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-shadow-11.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-shadow-12.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-shadow-13.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-shadow-14.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-shadow-15.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-shadow-16.png",
            "__ArachnidsFactionSE__/graphics/hr-Arachnids-die-shadow-17.png"
          },
          slice = 4,
          lines_per_file = 4,
          line_length = 4,
          width = 398,
          height = 240,
          frame_count = 17,
          shift = util.mul_shift(util.by_pixel(18, 18), scale),
          direction_count = 16,
          scale = 0.62 * scale,
          draw_as_shadow = true
        }
      }
    }
  }
end

arachnids_alternative_attacking_animation_sequence =
{
  warmup_frame_sequence = { 1, 2, 3, 4, 5, 6 },
  warmup2_frame_sequence = { 7, 7, 7, 7, 7, 7 },
  attacking_frame_sequence = { 7, 8, 9, 10, 11, 10, 9, 8, 7 },
  cooldown_frame_sequence = { 7 },
  prepared_frame_sequence = { 7 },
  back_to_walk_frame_sequence = { 6, 5, 4, 3, 2, 1 },

  warmup_animation_speed = 1 / 6 * 0.4,
  attacking_animation_speed = 1 / 16 * 0.4,
  cooldown_animation_speed = 1 / 1 * 0.4 * 0.125,
  prepared_animation_speed = 1 / 1 * 0.5 * 0.4,
  back_to_walk_animation_speed = 1 / 6 * 0.4
}


local function arachnids_spawner_integration()
return
  {
    filename = "__ArachnidsFactionSE__/graphics/Arachnids-spawner-idle-integration.png",
    variation_count = 4,
    width = 5,
    height = 20,
    shift = util.by_pixel(2, -2),
    frame_count = 1,
    line_length = 1,
    hr_version =
    {
      filename = "__ArachnidsFactionSE__/graphics/Arachnids-spawner-idle-integration.png",
      variation_count = 4,
      width = 5,
      height = 20,
      shift = util.by_pixel(3, -3),
      frame_count = 1,
      line_length = 1,
      scale = 0.5
    }
  }
end



local function arachnids_spawner_idle_animation(scale, variation)
return
  {
    layers =
    {
      {
        filename = "__ArachnidsFactionSE__/graphics/Arachnids-spawner-idle.png",
        line_length = 1,
        width = 175,
        height = 181,
	  frame_count = 1,
	  shift = util.mul_shift(util.by_pixel(-10, -20), scale),	
        --shift = util.by_pixel(-10, -20),
        y = variation * 181,
	 scale = scale,	
        hr_version =
        {
          filename = "__ArachnidsFactionSE__/graphics/hr-Arachnids-spawner-idle.png",
          line_length = 1,
          width = 350,
          height = 362,
	    frame_count = 1,
	    shift = util.mul_shift(util.by_pixel(-10, -20), scale),
          --shift = util.by_pixel(-10, -20),
          y = variation * 362,
          scale = 0.5 * scale
        }
      },
      {
        filename = "__ArachnidsFactionSE__/graphics/Arachnids-spawner-idle-shadow.png",
        draw_as_shadow = true,
        width = 185,
        height = 120,
	  frame_count = 1,
        shift = util.mul_shift(util.by_pixel(20, -2), scale),
        line_length = 1,
        y = variation * 120,
	  scale = 1.18 * scale,	
        hr_version =
        {
          filename = "__ArachnidsFactionSE__/graphics/hr-Arachnids-spawner-idle-shadow.png",
          draw_as_shadow = true,
          width = 370,
          height = 240,
	    frame_count = 1,
          shift = util.mul_shift(util.by_pixel(20, -2), scale),
          line_length = 1,
          y = variation * 240,
          scale = 0.59 * scale
        }
      }
    }
  }
end

local function arachnids_spawner_die_animation(scale,variation)
return
  {
    layers =
    {
      {
        filename = "__ArachnidsFactionSE__/graphics/Arachnids-spawner-die.png",
        line_length = 8,
        width = 175,
        height = 181,
        frame_count = 8,
        direction_count = 1,
        shift = util.mul_shift(util.by_pixel(-10, -20), scale),
        y = variation * 181,
	  scale = scale,
        hr_version =
        {
          filename = "__ArachnidsFactionSE__/graphics/hr-Arachnids-spawner-die.png",
          line_length = 8,
          width = 350,
          height = 362,
          frame_count = 8,
          direction_count = 1,
          shift = util.mul_shift(util.by_pixel(-10, -20), scale),
          y = variation * 362,
          scale = 0.5 * scale
        }
      },
      {
        filename = "__ArachnidsFactionSE__/graphics/Arachnids-spawner-die-shadow.png",
        draw_as_shadow = true,
        width = 185,
        height = 120,
        frame_count = 8,
        direction_count = 1,
        shift = util.mul_shift(util.by_pixel(20, -2), scale),
        line_length = 8,
        y = variation * 120,
	  scale = 1.18 * scale,
        hr_version =
        {
          filename = "__ArachnidsFactionSE__/graphics/hr-Arachnids-spawner-die-shadow.png",
          draw_as_shadow = true,
          width = 370,
          height = 240,
          frame_count = 8,
          direction_count = 1,
          shift = util.mul_shift(util.by_pixel(20, -2), scale),
          line_length = 8,
          y = variation * 240,
          scale = 0.59 * scale
        }
      }
    }
  }
end

arachnids_ground_patch = {
        sheet = {
          filename = "__base__/graphics/entity/biter/blood-puddle-var-main.png",
          flags = {
            "low-object"
          },
          frame_count = 1,
          height = 68,
          hr_version = {
            filename = "__base__/graphics/entity/biter/hr-blood-puddle-var-main.png",
            flags = {
              "low-object"
            },
            frame_count = 1,
            height = 134,
            line_length = 4,
            scale = 0.5,
            shift = {
              -0.015625,
              -0.015625
            },
            tint = {
              a = 1,
              b = 0.1,
              g = 1,
              r = 0.4
            },
            variation_count = 4,
            width = 164
          },
          line_length = 4,
          scale = 0.75,
          shift = {
            0.03125,
            0
          },
          tint = {
            a = 1,
            b = 0.1,
            g = 1,
            r = 0.4
          },
          variation_count = 4,
          width = 84
        }
      }

local particle_animations = {}

particle_animations.get_blood_particle_pictures = function(options)
  local options = options or {}
  return
  {
    sheet =
    {
      filename = "__base__/graphics/particle/blood-particle/blood-particle.png",
      line_length = 12,
      width = 10,
      height = 8,
      frame_count = 12,
      variation_count = 7,
      tint = options.tint,
      shift = util.add_shift(util.by_pixel(2,-1), options.shift),
      hr_version =
      {
        filename = "__base__/graphics/particle/blood-particle/hr-blood-particle.png",
        line_length = 12,
        width = 16,
        height = 16,
        frame_count = 12,
        variation_count = 7,
        tint = options.tint,
        scale = 0.5,
        shift = util.add_shift(util.by_pixel(1.5,-1), options.shift)
      }
    }
  }
end

Arachnid_Drone_Unit = table.deepcopy(data.raw.unit["small-biter"])
Arachnid_Drone_Unit.name = "arachnid-biter-drone-unit"
Arachnid_Drone_Unit.max_health = 30
Arachnid_Drone_Unit.run_animation = arachnidsrunanimation (small_arachnid_scale, small_arachnid_tint1, small_arachnid_tint2)
Arachnid_Drone_Unit.distance_per_frame = 0.2
Arachnid_Drone_Unit.attack_parameters.ammo_type = make_unit_melee_ammo_type(15)
Arachnid_Drone_Unit.attack_parameters.sound = arachnid_roars(0.35)
Arachnid_Drone_Unit.attack_parameters.animation = arachnidsattackanimation (small_arachnid_scale, small_arachnid_tint1, small_arachnid_tint2)
Arachnid_Drone_Unit.dying_sound =  arachnid_dying(0.5)
Arachnid_Drone_Unit.working_sound =  arachnid_calls(0.75)
Arachnid_Drone_Unit.corpse = "arachnid-drone-corpse"
Arachnid_Drone_Unit.localised_name = {"entity-name.arachnid-drone"} 

data:extend{Arachnid_Drone_Unit}

Arachnid_Warrior_Unit = table.deepcopy(data.raw.unit["medium-biter"])
Arachnid_Warrior_Unit.name = "arachnid-biter-warrior-unit"
Arachnid_Warrior_Unit.max_health = 100
Arachnid_Warrior_Unit.run_animation = arachnidsrunanimation (medium_arachnid_scale, medium_arachnid_tint1, medium_arachnid_tint2)
Arachnid_Warrior_Unit.distance_per_frame = 0.225
Arachnid_Warrior_Unit.attack_parameters.ammo_type = make_unit_melee_ammo_type(30)
Arachnid_Warrior_Unit.attack_parameters.sound = arachnid_roars(0.35)
Arachnid_Warrior_Unit.attack_parameters.animation = arachnidsattackanimation (medium_arachnid_scale, medium_arachnid_tint1, medium_arachnid_tint2)
Arachnid_Warrior_Unit.dying_sound =  arachnid_dying(0.5)
Arachnid_Warrior_Unit.working_sound =  arachnid_calls(0.75)
Arachnid_Warrior_Unit.corpse = "arachnid-warrior-corpse"
Arachnid_Warrior_Unit.localised_name = {"entity-name.arachnid-warrior"} 

data:extend{Arachnid_Warrior_Unit}

Arachnid_Tiger_Unit = table.deepcopy(data.raw.unit["big-biter"])
Arachnid_Tiger_Unit.name = "arachnid-biter-tiger-unit"
Arachnid_Tiger_Unit.run_animation = arachnidsrunanimation (big_biter_scale, big_arachnid_tint1, big_arachnid_tint2)
Arachnid_Tiger_Unit.distance_per_frame = 0.25
Arachnid_Tiger_Unit.attack_parameters.ammo_type = make_unit_melee_ammo_type(45)
Arachnid_Tiger_Unit.attack_parameters.sound = arachnid_roars(0.35)
Arachnid_Tiger_Unit.attack_parameters.animation = arachnidsattackanimation (big_arachnid_scale, big_arachnid_tint1, big_arachnid_tint2)
Arachnid_Tiger_Unit.dying_sound =  arachnid_dying(0.5)
Arachnid_Tiger_Unit.working_sound =  arachnid_calls(0.75)
Arachnid_Tiger_Unit.corpse = "arachnid-tiger-corpse"
Arachnid_Tiger_Unit.localised_name = {"entity-name.arachnid-tiger"} 

data:extend{Arachnid_Tiger_Unit}

Arachnid_Royal_Warrior_Unit = table.deepcopy(data.raw.unit["behemoth-biter"])
Arachnid_Royal_Warrior_Unit.name = "arachnid-biter-royalwarrior-unit"
Arachnid_Royal_Warrior_Unit.run_animation = arachnidsrunanimation (behemoth_arachnid_scale, behemoth_arachnid_tint1, behemoth_arachnid_tint2)
Arachnid_Royal_Warrior_Unit.distance_per_frame = 0.3
Arachnid_Royal_Warrior_Unit.attack_parameters.ammo_type = make_unit_melee_ammo_type(135)
Arachnid_Royal_Warrior_Unit.attack_parameters.sound = arachnid_roars(0.35)
Arachnid_Royal_Warrior_Unit.attack_parameters.animation = arachnidsattackanimation (behemoth_arachnid_scale, behemoth_arachnid_tint1, behemoth_arachnid_tint2)
Arachnid_Royal_Warrior_Unit.dying_sound =  arachnid_dying(0.5)
Arachnid_Royal_Warrior_Unit.working_sound =  arachnid_calls(0.75)
Arachnid_Royal_Warrior_Unit.corpse = "arachnid-royalwarrior-corpse"
Arachnid_Royal_Warrior_Unit.localised_name = {"entity-name.arachnid-royalwarrior"} 

data:extend{Arachnid_Royal_Warrior_Unit}

Arachnid_Unit_Spawner = table.deepcopy(data.raw["unit-spawner"]["biter-spawner"])
Arachnid_Unit_Spawner.name = "arachnid-spawner-unitspawner"
Arachnid_Unit_Spawner.animations = {arachnids_spawner_idle_animation(arachnid_spawner_scale_0,0),arachnids_spawner_idle_animation(arachnid_spawner_scale_1,1),arachnids_spawner_idle_animation(arachnid_spawner_scale_2,2),arachnids_spawner_idle_animation(arachnid_spawner_scale_3,3)}
Arachnid_Unit_Spawner.integration = {sheet = arachnids_spawner_integration()}
Arachnid_Unit_Spawner.corpse = "arachnid-unitspawner-corpse"
Arachnid_Unit_Spawner.result_units = (function()
                     local res = {}
						res[1] = {"arachnid-biter-drone-unit", {{0.0, 0.3}, {0.6, 0.0}}}
						res[2] = {"arachnid-biter-warrior-unit", {{0.2, 0.0}, {0.6, 0.3}, {0.7, 0.1}}}
						res[3] = {"arachnid-biter-tiger-unit", {{0.5, 0.0}, {1.0, 0.4}}}
						res[4] = {"arachnid-biter-royalwarrior-unit", {{0.9, 0.0}, {1.0, 0.3}}}
                     return res
                   end)()
Arachnid_Unit_Spawner.autoplace = arachnid_autoplace.arachnid_spawner_autoplace(2)
Arachnid_Unit_Spawner.spawning_cooldown = {150, 90}
				 
data:extend{Arachnid_Unit_Spawner}

Arachnid_Small_Spitter_Unit = table.deepcopy(data.raw.unit["small-spitter"])
Arachnid_Small_Spitter_Unit.name = "arachnid-spitter-smallspitter-unit"
Arachnid_Small_Spitter_Unit.run_animation = arachnidsrunanimation (small_arachnid_scale, small_arachnid_tint1, small_arachnid_tint2)
Arachnid_Small_Spitter_Unit.distance_per_frame = 0.225
Arachnid_Small_Spitter_Unit.attack_parameters.animation = arachnidsattackanimation (small_arachnid_scale, small_arachnid_tint1, small_arachnid_tint2)
Arachnid_Small_Spitter_Unit.alternative_attacking_frame_sequence = arachnids_alternative_attacking_animation_sequence
Arachnid_Small_Spitter_Unit.corpse = "arachnid-smallspitter-corpse"

data:extend{Arachnid_Small_Spitter_Unit}

Arachnid_Medium_Spitter_Unit = table.deepcopy(data.raw.unit["medium-spitter"])
Arachnid_Medium_Spitter_Unit.name = "arachnid-spitter-mediumspitter-unit"
Arachnid_Medium_Spitter_Unit.run_animation = arachnidsrunanimation (medium_arachnid_scale, medium_arachnid_tint1, medium_arachnid_tint2)
Arachnid_Medium_Spitter_Unit.distance_per_frame = 0.225
Arachnid_Medium_Spitter_Unit.attack_parameters.animation = arachnidsattackanimation (medium_arachnid_scale, medium_arachnid_tint1, medium_arachnid_tint2)
Arachnid_Medium_Spitter_Unit.alternative_attacking_frame_sequence = arachnids_alternative_attacking_animation_sequence
Arachnid_Medium_Spitter_Unit.corpse = "arachnid-mediumspitter-corpse"

data:extend{Arachnid_Medium_Spitter_Unit}

Arachnid_Big_Spitter_Unit = table.deepcopy(data.raw.unit["big-spitter"])
Arachnid_Big_Spitter_Unit.name = "arachnid-spitter-bigspitter-unit"
Arachnid_Big_Spitter_Unit.run_animation = arachnidsrunanimation (big_arachnid_scale, big_arachnid_tint1, big_arachnid_tint2)
Arachnid_Big_Spitter_Unit.distance_per_frame = 0.225
Arachnid_Big_Spitter_Unit.attack_parameters.animation = arachnidsattackanimation (big_arachnid_scale, big_arachnid_tint1, big_arachnid_tint2)
Arachnid_Big_Spitter_Unit.alternative_attacking_frame_sequence = arachnids_alternative_attacking_animation_sequence
Arachnid_Big_Spitter_Unit.corpse = "arachnid-bigspitter-corpse"

data:extend{Arachnid_Big_Spitter_Unit}

Arachnid_Behemoth_Spitter_Unit = table.deepcopy(data.raw.unit["behemoth-spitter"])
Arachnid_Behemoth_Spitter_Unit.name = "arachnid-spitter-behemothspitter-unit"
Arachnid_Behemoth_Spitter_Unit.run_animation = arachnidsrunanimation (behemoth_arachnid_scale, behemoth_arachnid_tint1, behemoth_arachnid_tint2)
Arachnid_Behemoth_Spitter_Unit.distance_per_frame = 0.225
Arachnid_Behemoth_Spitter_Unit.attack_parameters.animation = arachnidsattackanimation (behemoth_arachnid_scale, behemoth_arachnid_tint1, behemoth_arachnid_tint2)
Arachnid_Behemoth_Spitter_Unit.alternative_attacking_frame_sequence = arachnids_alternative_attacking_animation_sequence
Arachnid_Behemoth_Spitter_Unit.corpse = "arachnid-behemothspitter-corpse"

data:extend{Arachnid_Behemoth_Spitter_Unit}

Arachnid_Spitter_Spawner = table.deepcopy(data.raw["unit-spawner"]["spitter-spawner"])
Arachnid_Spitter_Spawner.name = "arachnid-spawner-spitterspawner"
Arachnid_Spitter_Spawner.animations = {arachnids_spawner_idle_animation(arachnid_spawner_scale_3,0),arachnids_spawner_idle_animation(arachnid_spawner_scale_2,1),arachnids_spawner_idle_animation(arachnid_spawner_scale_0,2),arachnids_spawner_idle_animation(arachnid_spawner_scale_1,3)}
Arachnid_Spitter_Spawner.integration = {sheet = arachnids_spawner_integration()}
Arachnid_Spitter_Spawner.corpse = "arachnid-spitterspawner-corpse"
Arachnid_Spitter_Spawner.result_units = (function()
                     local res = {}
						res[1] = {"arachnid-spitter-smallspitter-unit", {{0.25, 0.0}, {0.5, 0.3}, {0.7, 0.0}}}
						res[2] = {"arachnid-spitter-mediumspitter-unit", {{0.4, 0.0}, {0.7, 0.3}, {0.9, 0.1}}}
						res[3] = {"arachnid-spitter-bigspitter-unit", {{0.5, 0.0}, {1.0, 0.4}}}
						res[4] = {"arachnid-spitter-behemothspitter-unit", {{0.9, 0.0}, {1.0, 0.3}}}
                     return res
                   end)()
Arachnid_Spitter_Spawner.autoplace = arachnid_autoplace.arachnid_spawner_autoplace(2)
Arachnid_Spitter_Spawner.spawning_cooldown = {150, 90}
				   
data:extend{Arachnid_Spitter_Spawner}

arachnid_drone_corpse = table.deepcopy(data.raw.corpse["small-biter-corpse"])
arachnid_drone_corpse.name = "arachnid-drone-corpse"
arachnid_drone_corpse.ground_patch = arachnids_ground_patch
arachnid_drone_corpse.animation = arachnidsdieanimation (small_biter_scale, small_biter_tint1, small_biter_tint2)
arachnid_drone_corpse.localised_name = {"entity-name.arachnid-drone-corpse"} 

data:extend{arachnid_drone_corpse}

arachnid_warrior_corpse = table.deepcopy(data.raw.corpse["medium-biter-corpse"])
arachnid_warrior_corpse.name = "arachnid-warrior-corpse"
arachnid_warrior_corpse.ground_patch = arachnids_ground_patch
arachnid_warrior_corpse.animation = arachnidsdieanimation (medium_biter_scale, medium_biter_tint1, medium_biter_tint2)
arachnid_warrior_corpse.localised_name = {"entity-name.arachnid-warrior-corpse"} 

data:extend{arachnid_warrior_corpse}

arachnid_tiger_corpse = table.deepcopy(data.raw.corpse["big-biter-corpse"])
arachnid_tiger_corpse.name = "arachnid-tiger-corpse"
arachnid_tiger_corpse.ground_patch = arachnids_ground_patch
arachnid_tiger_corpse.animation = arachnidsdieanimation (big_biter_scale, big_biter_tint1, big_biter_tint2)
arachnid_tiger_corpse.localised_name = {"entity-name.arachnid-tiger-corpse"} 

data:extend{arachnid_tiger_corpse}

arachnid_royalwarrior_corpse = table.deepcopy(data.raw.corpse["behemoth-biter-corpse"])
arachnid_royalwarrior_corpse.name = "arachnid-royalwarrior-corpse"
arachnid_royalwarrior_corpse.ground_patch = arachnids_ground_patch
arachnid_royalwarrior_corpse.animation = arachnidsdieanimation (behemoth_biter_scale, behemoth_biter_tint1, behemoth_biter_tint2)
arachnid_royalwarrior_corpse.localised_name = {"entity-name.arachnid-royalwarrior-corpse"} 

data:extend{arachnid_royalwarrior_corpse}

arachnid_unitspawner_corpse = table.deepcopy(data.raw.corpse["biter-spawner-corpse"])
arachnid_unitspawner_corpse.name = "arachnid-unitspawner-corpse"
arachnid_unitspawner_corpse.animation = {arachnids_spawner_die_animation(arachnid_spawner_scale_0,0),arachnids_spawner_die_animation(arachnid_spawner_scale_1,1),arachnids_spawner_die_animation(arachnid_spawner_scale_2,2),arachnids_spawner_die_animation(arachnid_spawner_scale_3,3)}
arachnid_unitspawner_corpse.ground_patch = {sheet = arachnids_spawner_integration()}
arachnid_unitspawner_corpse.dying_speed = 0.04
arachnid_unitspawner_corpse.localised_name = {"entity-name.arachnid-unitspawner-corpse"} 

data:extend{arachnid_unitspawner_corpse}

arachnid_smallspitter_corpse = table.deepcopy(data.raw.corpse["small-spitter-corpse"])
arachnid_smallspitter_corpse.name = "arachnid-smallspitter-corpse"
arachnid_smallspitter_corpse.ground_patch = arachnids_ground_patch
arachnid_smallspitter_corpse.animation = arachnidsdieanimation (small_biter_scale, small_biter_tint1, small_biter_tint2)
arachnid_smallspitter_corpse.localised_name = {"entity-name.arachnid-smallspitter-corpse"} 

data:extend{arachnid_smallspitter_corpse}

arachnid_mediumspitter_corpse = table.deepcopy(data.raw.corpse["medium-spitter-corpse"])
arachnid_mediumspitter_corpse.name = "arachnid-mediumspitter-corpse"
arachnid_mediumspitter_corpse.ground_patch = arachnids_ground_patch
arachnid_mediumspitter_corpse.animation = arachnidsdieanimation (medium_biter_scale, small_biter_tint1, small_biter_tint2)
arachnid_mediumspitter_corpse.localised_name = {"entity-name.arachnid-mediumspitter-corpse"} 

data:extend{arachnid_mediumspitter_corpse}

arachnid_bigspitter_corpse = table.deepcopy(data.raw.corpse["big-spitter-corpse"])
arachnid_bigspitter_corpse.name = "arachnid-bigspitter-corpse"
arachnid_bigspitter_corpse.ground_patch = arachnids_ground_patch
arachnid_bigspitter_corpse.animation = arachnidsdieanimation (medium_biter_scale, small_biter_tint1, small_biter_tint2)
arachnid_bigspitter_corpse.localised_name = {"entity-name.arachnid-bigspitter-corpse"} 

data:extend{arachnid_bigspitter_corpse}

arachnid_behemothspitter_corpse = table.deepcopy(data.raw.corpse["behemoth-spitter-corpse"])
arachnid_behemothspitter_corpse.name = "arachnid-behemothspitter-corpse"
arachnid_behemothspitter_corpse.ground_patch = arachnids_ground_patch
arachnid_behemothspitter_corpse.animation = arachnidsdieanimation (medium_biter_scale, small_biter_tint1, small_biter_tint2)
arachnid_behemothspitter_corpse.localised_name = {"entity-name.arachnid-behemothspitter-corpse"} 

data:extend{arachnid_behemothspitter_corpse}

arachnid_spitterspawner_corpse = table.deepcopy(data.raw.corpse["spitter-spawner-corpse"])
arachnid_spitterspawner_corpse.name = "arachnid-spitterspawner-corpse"
arachnid_spitterspawner_corpse.animation = {arachnids_spawner_die_animation(arachnid_spawner_scale_3,0),arachnids_spawner_die_animation(arachnid_spawner_scale_2,1),arachnids_spawner_die_animation(arachnid_spawner_scale_0,2),arachnids_spawner_die_animation(arachnid_spawner_scale_1,3)}
arachnid_spitterspawner_corpse.ground_patch = {sheet = arachnids_spawner_integration()}
arachnid_spitterspawner_corpse.dying_speed = 0.04
arachnid_spitterspawner_corpse.localised_name = {"entity-name.arachnid-spitterspawner-corpse"} 

data:extend{arachnid_spitterspawner_corpse}















