const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/components/**/*.{erb,haml,html,slim,rb}',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      boxShadow: {
        'focus': '0 0 0 4px rgba(244, 235, 255, 1.0)',
        'focus-gray': '0 0 0 4px rgba(242, 244, 247, 1.0)'
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        roboto: ['Roboto var', ...defaultTheme.fontFamily.sans],
      },

      colors: {
        primary: {
          25: '#fcfaff',
          50: '#f9f5ff',
          100: '#f4ebff',
          200: '#e9d7fe',
          300: '#d6bbfb',
          400: '#b692f6',
          500: '#9e77ed',
          600: '#7f56d9',
          700: '#6941c6',
          800: '#53389e',
          900: '#42307d'
        },
        success: {
          25: '#f6fef9',
          50: '#ecfdf3',
          100: '#d1fadf',
          200: '#a6f4c5',
          300: '#6ce9a6',
          400: '#32d583',
          500: '#12b76a',
          600: '#039855',
          700: '#027a48',
          800: '#05603a',
          900: '#054f31'
        },
        error: {
          25: '#fffbfa',
          50: '#fef3f2',
          100: '#fee4e2',
          200: '#fecdca',
          300: '#fda29b',
          400: '#f97066',
          500: '#f04438',
          600: '#d92d20',
          700: '#b42318',
          800: '#912018',
          900: '#7a271a'
        },
        warning: {
          25: '#fffcf5',
          50: '#fffceb',
          100: '#fef0c7',
          200: '#fedf89',
          300: '#fec84b',
          400: '#fdb022',
          500: '#f79009',
          600: '#dc6803',
          700: '#b54708',
          800: '#93370d',
          900: '#7a2e0e'
        },
        blue: {
          25: '#f5faff',
          50: '#eff8ff',
          100: '#d1e9ff',
          200: '#b2ddff',
          300: '#84caff',
          400: '#53b1fd',
          500: '#2e90fa',
          600: '#1570ef',
          700: '#175cd3',
          800: '#1849a9',
          900: '#194185'
        },
        gray: {
          25: '#fcfcfd',
          50: '#f9fafb',
          100: '#f2f4f7',
          200: '#eaecf0',
          300: '#d0d5dd',
          400: '#98a2b3',
          500: '#667085',
          600: '#475467',
          700: '#344054',
          800: '#1d2939',
          900: '#101828'
        },
        bluegray: {
          25: '#fcfcfd',
          50: '#f8f9fc',
          100: '#eaecf5',
          200: '#d5d9eb',
          300: '#afb5d9',
          400: '#717bbc',
          500: '#4e5ba6',
          600: '#3e4784',
          700: '#363f72',
          800: '#293056',
          900: '#101323'
        },
        bluelight: {
          25: '#f5fbff',
          50: '#f0f9ff',
          100: '#e0f2fe',
          200: '#b9e6fe',
          300: '#7cd4fd',
          400: '#36bffa',
          500: '#0ba5ec',
          600: '#0086c9',
          700: '#026aa2',
          800: '#065986',
          900: '#0b4a6f'
        },
        purple: {
          25: '#fafaff',
          50: '#f4f3ff',
          100: '#ebe9fe',
          200: '#d9d6fe',
          300: '#bdb4fe',
          400: '#9b8afb',
          500: '#7a5af8',
          600: '#6938ef',
          700: '#5925dc',
          800: '#4a1fb8',
          900: '#3e1c96'
        },
        pink: {
          25: '#fef6fb',
          50: '#fdf2fa',
          100: '#fce7f6',
          200: '#fcceee',
          300: '#faa7e0',
          400: '#f670c7',
          500: '#ee46bc',
          600: '#dd2590',
          700: '#c11574',
          800: '#9e165f',
          900: '#851651'
        },
        rosé: {
          25: '#fff5f6',
          50: '#fff1f3',
          100: '#ffe4e8',
          200: '#fecdd6',
          300: '#fea3b4',
          400: '#fd6f8e',
          500: '#f63d68',
          600: '#e31b54',
          700: '#c01048',
          800: '#a11043',
          900: '#89123e'
        },
        orange: {
          25: '#fffaf5',
          50: '#fff6ed',
          100: '#ffead5',
          200: '#fddcab',
          300: '#feb273',
          400: '#fd853a',
          500: '#fb6514',
          600: '#ec4a0a',
          700: '#c4320a',
          800: '#9c2a10',
          900: '#7e2410'
        },
        indigo: {
          25: '#f5f8ff',
          50: '#eef4ff',
          100: '#e0eaff',
          200: '#c7d7fe',
          300: '#a4bcfd',
          400: '#8098f9',
          500: '#6172f3',
          600: '#444ce7',
          700: '#3538cd',
          800: '#2d31a6',
          900: '#2d3282'
        }
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
