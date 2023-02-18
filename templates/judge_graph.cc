#include <fstream>
#include <iostream>
#include <sys/types.h>
#include <vector>

// graph.hh
struct Edge {
    int src, dst;
};

class Graph {
  protected:
    std::vector<std::vector<int>> adjList;

    size_t edges = 0;
    size_t nodes;

  public:
    explicit Graph(const size_t n) {
        this->nodes = n;
        this->adjList.resize(n);
    }

    void addEdge(const Edge edge) {
        this->adjList[edge.src].push_back(edge.dst);
        this->adjList[edge.dst].push_back(edge.src);
        this->edges++;
    }

    const std::vector<int> &getAdjList(const int node) const {
        return this->adjList[node];
    }

    void print() const {
        for (size_t i = 0; i < this->N(); i++) {
            std::cerr << i << " -> ";
            for (int node : this->adjList[i]) {
                std::cerr << node << ' ';
            }
            std::cerr << std::endl;
        }
    }

    void dot() const {
        std::ofstream out("graph.dot");
        out << "strict graph {";
        for (size_t i = 0; i < this->N(); i++) {
            out << i << "--{";
            for (int node : this->adjList[i]) {
                out << node << ' ';
            }
            out << '}';
        }
        out << '}';
    }

    const size_t N() const { return this->nodes; }
    const size_t M() const { return this->edges; }
};

class OrientedGraph : public Graph {
  private:
    std::vector<std::vector<int>> invAdjList;

  public:
    explicit OrientedGraph(const size_t n) : Graph(n) { invAdjList.resize(n); }

    void addEdge(const Edge edge) {
        this->adjList[edge.src].push_back(edge.dst);
        this->invAdjList[edge.dst].push_back(edge.src);
        this->edges++;
    }

    const std::vector<int> &getInvAdjList(const int node) const {
        return this->invAdjList[node];
    }

    void dot() const {
        std::ofstream out("graph.dot");
        out << "strict digraph {";
        for (size_t i = 0; i < this->N(); i++) {
            out << i << "->{";
            for (int node : this->adjList[i]) {
                out << node << ' ';
            }
            out << '}';
        }
        out << '}';
    }
};
