INSERT INTO dbblog.book_note (id, title, description, author, content, content_format, read_num, comment_num, like_num, cover, book_id, chapter, create_time, update_time, recommend, category_id, publish, cover_type, top) VALUES (1, 'Java虚拟机01——Java内存数据区域和内存溢出异常', 'Java虚拟机在执行Java程序的过程中会把它所管理的内存划分为若干个不同的数据区域。这些区域都有各自的用途，以及创建和销毁的时间，有的区域随着虚拟机进程的启动而存在，有些区域则依赖用户线程的启动和结束而建立和销毁.', 'zhy', '# 运行时数据区域
> Java虚拟机在执行Java程序的过程中会把它所管理的内存划分为若干个不同的数据区域。这些区域都有各自的用途，以及创建和销毁的时间，有的区域随着虚拟机进程的启动而存在，有些区域则依赖用户线程的启动和结束而建立和销毁。根据《Java虚拟机规范（Java SE 7版）》的规定，Java虚拟机所管理的内存将会包括以下几个运行时数据区域，如下图所示：
我们可以将上面的数据区域分为线程独有、线程共享及其他三大区域：
## 1.1. 线程独有的数据区域
### 1. 程序计数器（Program Counter Register）
1.   当前线程所执行的字节码的行号指示器。
2. 用于选取下一条需要执行的字节码指令，分支、循环、跳转、异常处理、线程恢复需要依赖这个计数

### 2. 虚拟机栈（Java Stack）
位于线程私有的内存中，生命周期与线程相同。
描述了Java方法执行的内存模型。
方法执行时使用栈帧（Stack Frame）来存储局部变量表、操作数栈、动态链接、方法出口等信息。
如果线程请求的栈深度大于虚拟机所允许的深度，将抛出StackOverflowError异常。
如果虚拟机栈可以动态扩展，如果扩展时无法申请到足够的内存，就会抛出OutOfMemoryError异常。
### 3. 本地方法栈（Native Method Stack）
与虚拟机栈相类似，区域在于本地方法栈为虚拟机使用到的Native方法服务。
可以由虚拟机设计者自己实现。
本地方法栈区域也会抛出==StackOverflowError==和==OutOfMemoryError==异常
## 1.2. 线程共享的数据区域
Java堆（Heap）
是Java虚拟机所管理内存中最大的一块，在虚拟机启动时创建。
在Java虚拟机规范中的描述是：所有的对象实例以及数组都要在堆上分配。随着JIT编译器的发展与逃逸分析技术逐渐成熟，栈上分配、标量替换优化技术导致某些对象并没有分配在堆上。
Java GC工作的主要区域。现代收集器基本都采用分代收集算法，所以Java堆中还可以细分为新生代和老年代；再细致一点的有Eden空间、From Survivor空间、To Survivor空间等。
如果在堆中没有内存完成实例分配，并且堆也无法再扩展时，将会抛出==OutOfMemoryError==异常。
方法区（Method Area）
用于存储已被虚拟机加载的类信息、常量、静态变量、即时编译器编译后的代码等数据。
它有一个别名叫做Non-Heap（非堆），目的应该是与Java堆区分开来。
HotSpot虚拟机选择把GC分代收集扩展至方法区，即使用永久代来实现方法区，因此也有人将此区域称为“永久代”；JDK 1.7的HotSpot中，已经把原本放在永久代的字符串常量池移出，并逐步改为采用Native Memory来实现方法区的规划。
根据Java虚拟机规范的规定，当方法区无法满足内存分配需求时，将抛出==OutOfMemoryError==异常。
运行时常量池（Runtime Constant Pool）
运行时常量池是方法区的一部分。
Class文件中除了有类的版本、字段、方法、接口等描述信息外，还有一项信息是常量池（Constant Pool Table），用于存放编译期生成的各种字面量和符号引用，这部分内容将在类加载后进入方法区的运行时常量池中存放。
当常量池无法再申请到内存时会抛出==OutOfMemoryError==异常。
## 1.3. 其他区域
直接内存（Direct Memory）
直接内存并不是虚拟机运行时数据区的一部分，也不是Java虚拟机规范中定义的内存区域。
这部分内存也可能导致OutOfMemoryError异常出现。
', '<h1 id="-">运行时数据区域</h1>
<blockquote>
<p>Java虚拟机在执行Java程序的过程中会把它所管理的内存划分为若干个不同的数据区域。这些区域都有各自的用途，以及创建和销毁的时间，有的区域随着虚拟机进程的启动而存在，有些区域则依赖用户线程的启动和结束而建立和销毁。根据《Java虚拟机规范（Java SE 7版）》的规定，Java虚拟机所管理的内存将会包括以下几个运行时数据区域，如下图所示：
我们可以将上面的数据区域分为线程独有、线程共享及其他三大区域：</p>
</blockquote>
<h2 id="1-1-">1.1. 线程独有的数据区域</h2>
<h3 id="1-program-counter-register-">1. 程序计数器（Program Counter Register）</h3>
<ol>
<li>当前线程所执行的字节码的行号指示器。</li>
<li>用于选取下一条需要执行的字节码指令，分支、循环、跳转、异常处理、线程恢复需要依赖这个计数</li>
</ol>
<h3 id="2-java-stack-">2. 虚拟机栈（Java Stack）</h3>
<p>位于线程私有的内存中，生命周期与线程相同。
描述了Java方法执行的内存模型。
方法执行时使用栈帧（Stack Frame）来存储局部变量表、操作数栈、动态链接、方法出口等信息。
如果线程请求的栈深度大于虚拟机所允许的深度，将抛出StackOverflowError异常。
如果虚拟机栈可以动态扩展，如果扩展时无法申请到足够的内存，就会抛出OutOfMemoryError异常。</p>
<h3 id="3-native-method-stack-">3. 本地方法栈（Native Method Stack）</h3>
<p>与虚拟机栈相类似，区域在于本地方法栈为虚拟机使用到的Native方法服务。
可以由虚拟机设计者自己实现。
本地方法栈区域也会抛出==StackOverflowError==和==OutOfMemoryError==异常</p>
<h2 id="1-2-">1.2. 线程共享的数据区域</h2>
<p>Java堆（Heap）
是Java虚拟机所管理内存中最大的一块，在虚拟机启动时创建。
在Java虚拟机规范中的描述是：所有的对象实例以及数组都要在堆上分配。随着JIT编译器的发展与逃逸分析技术逐渐成熟，栈上分配、标量替换优化技术导致某些对象并没有分配在堆上。
Java GC工作的主要区域。现代收集器基本都采用分代收集算法，所以Java堆中还可以细分为新生代和老年代；再细致一点的有Eden空间、From Survivor空间、To Survivor空间等。
如果在堆中没有内存完成实例分配，并且堆也无法再扩展时，将会抛出==OutOfMemoryError==异常。
方法区（Method Area）
用于存储已被虚拟机加载的类信息、常量、静态变量、即时编译器编译后的代码等数据。
它有一个别名叫做Non-Heap（非堆），目的应该是与Java堆区分开来。
HotSpot虚拟机选择把GC分代收集扩展至方法区，即使用永久代来实现方法区，因此也有人将此区域称为“永久代”；JDK 1.7的HotSpot中，已经把原本放在永久代的字符串常量池移出，并逐步改为采用Native Memory来实现方法区的规划。
根据Java虚拟机规范的规定，当方法区无法满足内存分配需求时，将抛出==OutOfMemoryError==异常。
运行时常量池（Runtime Constant Pool）
运行时常量池是方法区的一部分。
Class文件中除了有类的版本、字段、方法、接口等描述信息外，还有一项信息是常量池（Constant Pool Table），用于存放编译期生成的各种字面量和符号引用，这部分内容将在类加载后进入方法区的运行时常量池中存放。
当常量池无法再申请到内存时会抛出==OutOfMemoryError==异常。</p>
<h2 id="1-3-">1.3. 其他区域</h2>
<p>直接内存（Direct Memory）
直接内存并不是虚拟机运行时数据区的一部分，也不是Java虚拟机规范中定义的内存区域。
这部分内存也可能导致OutOfMemoryError异常出现。</p>
', 11, 0, 1, null, 1, '第2章 Java内存区域与内存溢出异常', '2020-03-09 17:11:05', '2020-03-04 17:51:15', 1, '4,5,6', 1, 2, null);