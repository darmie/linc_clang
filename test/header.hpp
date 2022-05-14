// header.hpp

class MyClass
{
public:
  int field;
  virtual void method() const = 0;

  static const int static_field;
  static int static_method();
};


enum class Cpp11Enum
{
  RED = 10,
  BLUE = 20
};

struct Wowza
{
  virtual ~Wowza() = default;
  virtual void foo(int i = 0) = 0;
};

struct Badabang : Wowza
{
  void foo(int) override;

  bool operator==(const Badabang& o) const;
};

template <typename T>
void bar(T&& t);